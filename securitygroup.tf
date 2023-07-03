# Creating a Security Group for Logging server
resource "aws_security_group" "customer-SG" {
  vpc_id      = aws_vpc.ase-ecr-vpc.id
  description = "ALL"

  # Name of the security Group!
  name = "customer-app-sg"

  # Created an inbound rule for SSH
  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outward Network Traffic for the WordPress
  egress {
    description = "output from Logging Server"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    description = "output from Logging Server"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
