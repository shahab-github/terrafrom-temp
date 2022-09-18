# Creating a new security group and adding rules to it

resource "aws_security_group" "secgrp" {
  name        = "web-sg"
  description = "For Web server"
  vpc_id      = "default"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = tcp
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = tcp
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}


# if you have a security group and would like to add a new rule 
# you need to give the security_group_ID

resource "aws_security_group_rule" "rule" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "<existing sec grp ip>"

}
