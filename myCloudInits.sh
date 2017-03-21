#!/bin/bash
yum update -y
yum install -y jq

AZ=$(curl http://169.254.169.254/latest/meta-data/placement/availability-zone/)

echo "AZ == $AZ"

EBS_VOLUMEID=$(aws ec2 create-volume  --size 5 --region us-west-2 --availability-zone $AZ --volume-type gp2  | jq --raw-output '.VolumeId')
INSTANCE_ID=$(curl http://169.254.169.254/latest/meta-data/instance-id)

sleep 20

echo "Volume ID == $EBS_VOLUMEID"
echo "Instance ID == $INSTANCE_ID"

echo "Running the following command - aws ec2 attach-volume --volume-id $EBS_VOLUMEID --instance-id $INSTANCE_ID --device /dev/xvdf"

aws ec2 attach-volume --region us-west-2 --volume-id $EBS_VOLUMEID --instance-id $INSTANCE_ID --device /dev/xvdf

sleep 5

mkfs -t ext4 /dev/xvdf
mkdir /sbmnt
mount /dev/xvdf /sbmnt


