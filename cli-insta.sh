
aws ec2 run-instances \
    --image-id ami-0953476d60561c955 \
    --instance-type t2.micro \
    --subnet-id subnet-0a673b0e80b8f1bdb \
    --security-group-ids sg-0069d236c978432dd \
    --tag-specs '{"ResourceType":"instance","Tags":[{"Key":"Name","Value":"cli-instance"}]}'

aws ec2 describe-instances \
  --filters "Name=tag:Name,Values=cli-instance" \
  --query "Reservations[0].Instances[0].[PrivateIpAddress, PublicIpAddress]" \
  --output text
