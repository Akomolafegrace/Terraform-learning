resource "aws_lightsail_instance" "example" {
  name              = "my-lightsail-instance"
  availability_zone = "us-east-1a" 
  blueprint_id      = "amazon_linux_2" 
  bundle_id         = "nano_1_0" 
  #key_pair_name     = "my-key-pair" 

  user_data = <<EOF
#!/bin/bash
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>This server is created using terraform </h1>" > /var/www/html/index.html
EOF
}