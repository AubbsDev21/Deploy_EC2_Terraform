#Getting Linux AMI ID using SSM Parameter endpoint in us-east-1 (master)
data "aws_ssm_parameter" "linuxAmiMaster" {
  provider = aws.region-master
  name     = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

#Get Linux AMI ID using SSM Parameter endpoint in us-west-2 (Workers)
data "aws_ssm_parameter" "linuxAmiWork" {
  provider = aws.region-worker
  name     = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

#Creating key-pair for logging into EC2 in us-east-1
resource "aws_key_pair" "master-key" {
  provider   = aws.region-master
  key_name   = "Docker"
  public_key = file("~/.ssh/id_rsa.pub")
}

#Creating key-pair for logging into EC2 in us-west-2
resource "aws_key_pair" "worker-key" {
  provider   = aws.region-worker
  key_name   = "Docker"
  public_key = file("~/.ssh/id_rsa.pub")
}










