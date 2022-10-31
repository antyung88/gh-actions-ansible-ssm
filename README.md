# gh-actions-ansible-ssm

Ansible SSM for private, hybrid cloud for AWS

## Prerequisites
- docker & docker-compose
- aws credentials
- iam roles for ssm & s3
- s3 bucket
- ec2 instance id
- iam roles for ec2 ssm

## Getting Started

```
git clone https://github.com/antyung88/gh-actions-ansible-ssm.git
```

```
cd gh-actions-ansible-ssm
```

Input Variables
```
vi docker-compose.yml
```
- aws_user_name: 
- ansible_aws_ssm_access_key_id:
- ansible_aws_ssm_secret_access_key:
- ansible_aws_ssm_region: ap-southeast-1
- ansible_aws_ssm_bucket_name:
- ansible_aws_ssm_instance_id: 

Edit Playbook
```
vi playbook/playbook.yml
```

Play
```
docker-compose up
```

## Todo

- Alpine builds
- Docker Slim builds
- gh-actions composite release
