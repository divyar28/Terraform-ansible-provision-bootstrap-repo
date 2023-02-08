resource "aws_security_group" "allow_home"{
  name        = "allow_home_jenkins-01"
  description = "Allow HOME inbound traffic"
  vpc_id      = "vpc-06e225d1daa12836e"

  ingress {
    description      = "Home IP SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["72.82.148.237/32"]
  }

 ingress {
    description      = "Home IP SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["69.120.74.78/32"]
 }

  ingress {
    description      = "Home IP 443"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["72.82.148.237/32"]
  }
ingress {
    description      = "Home IP 8080"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["69.120.74.78/32"]

}

  ingress {
    description      = "Home IP 443"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["69.120.74.78/32"]
  }

  ingress {
    description      = "Home IP 80"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["72.82.148.237/32"]
  }

 ingress {
    description      = "Home IP 80"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["69.120.74.78/32"]
  }

ingress {
    description      = "Home IP 8080"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["72.82.148.237/32"]
  } 

  egress {
  	description      = "Allow All Outbound"
    from_port        = 0

    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Allow home"
  }

}

resource "aws_instance" "jenkins" {
  #ami = "ami-090fa75af13c156b4"

  ami = "ami-08c40ec9ead489470"
  instance_type = "t3.medium"
  key_name = "ubuntukeypair"
  associate_public_ip_address = "true"
  subnet_id = "subnet-08788e49e55763e8a" 
iam_instance_profile = "${aws_iam_instance_profile.jenkins_iam_profile.name}"
  vpc_security_group_ids=[aws_security_group.allow_home.id]
  tags = {
	Name = "jenkins on Ubuntu"
  }
}
