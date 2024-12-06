#!/bin/bash

######################################################
# Author: mihirxtc
# Date: 06/12/2024
# Description: Shell script for tracking AWS resources
# ####################################################

# List of services
# ----------------
# AWS s3 Buckets
# AWS EC2
# AWS Lambda
# AWS IAM Users

# set -x
# set -e
# set -o pipefail

# listing s3 buckets
echo "List of s3 Buckets"
aws s3 ls > resourceTrackerFile

# listing ec2 Instances
echo "List of ec2 Instances"
aws ec2 describe-instances | jq ".Reservations[].Instances[].InstanceId" >> resourceTrackerFile

# listing lambda functions
echo "List of lambda functions"
aws lambda list-functions >> resourceTrackerFile

# list of IAM Users
echo "List of IAM Users"
aws iam list-users | jq ".Users[].UserName" >> resourceTrackerFile
