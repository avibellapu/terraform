provider "aws" {
	profile: default
	region: "us-east-1"
}

resource "aws_instance" "testaform" {
	ami = ""
	instance_type = "t2.micro"
}

connection {
   type     = "ssh"
   user     = "root"
   private_key = file("~/.ssh/id_rsa")
   host     = self.ip
}

provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras enable nginx1.12",
      "sudo yum -y install nginx",
      "sudo systemctl start nginx"
    ]
}