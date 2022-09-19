# creating a new ec2 instance and attaching the existing key-pair & security group


resource "aws_instance" "ec2" {
  ami               = "ami-052efd3df9dad4825"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  key_name          = "MyKey"             #"<existing key-pair Name"
  security_groups   = ["launch-wizard-1"] #existing sec grp name

  user_data = <<-EOF
    #1/bin/bash
    sudo apt update -y
    sudo apt install apache2 -y
    sudo systemctl start apache2
    sudo chown -R $USER:$USER /var/www/html
    EOF

  tags = {
    "Name" = "Mywebserver"
  }
}
