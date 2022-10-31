FROM ubuntu

USER root

ENV ANSIBLE_HOST_KEY_CHECKING=False

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y unzip curl ansible python3 python3-pip && \
    pip3 install boto3 botocore && \
    ansible-galaxy collection install community.aws && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install && \
    curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb" && \
    dpkg -i session-manager-plugin.deb

COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
