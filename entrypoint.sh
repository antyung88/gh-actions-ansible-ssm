#!/bin/bash
echo "ansible_connection: $ansible_connection" > /.env
echo "ansible_python_interpreter: $ansible_python_interpreter" >> /.env
echo "aws_user_name: $aws_user_name" >> /.env
echo "ansible_aws_ssm_access_key_id: $ansible_aws_ssm_access_key_id" >> /.env
echo "ansible_aws_ssm_secret_access_key: $ansible_aws_ssm_secret_access_key" >> /.env
echo "ansible_aws_ssm_region: $ansible_aws_ssm_region" >> /.env
echo "ansible_aws_ssm_bucket_name: $ansible_aws_ssm_bucket_name" >> /.env
echo "ansible_aws_ssm_instance_id: $ansible_aws_ssm_instance_id" >> /.env
echo "become: true" >> /.env
mkdir -p /root/.aws

cat <<EOF > /root/.aws/credentials
[default]
aws_access_key_id = ${ansible_aws_ssm_access_key_id}
aws_secret_access_key = ${ansible_aws_ssm_secret_access_key}
[${aws_user_name}]
aws_access_key_id = ${ansible_aws_ssm_access_key_id}
aws_secret_access_key = ${ansible_aws_ssm_secret_access_key}
EOF

cat <<EOF > /root/.aws/config
[default]
region = ${ansible_aws_ssm_region}
output = json
[${aws_user_name}]
region = ${ansible_aws_ssm_region}
output = json
EOF

cd /ansible && ansible-playbook -i hosts playbook.yml
