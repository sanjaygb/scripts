# aws ec2 run-instances --image-id ami-2bb65342 --count 4 --instance-type t2.micro --user-data "replicate-every=1min | replicate-every=5min | replicate-every=10min"

# aws ec2 run-instances --key-name SB --image-id ami-7172b611  --count 4 --instance-type t2.micro --user-data "replicate-every=1min | replicate-every=5min | replicate-every=10min" --security-groups default

# aws ec2 terminate-instances --instance-ids `aws ec2 describe-instances | jq --raw-output '.Reservations[] .Instances[] .InstanceId' | head -1`

# aws lambda list-functions --query 'Functions[*].[FunctionArn,CodeSize]' --region us-west-2
