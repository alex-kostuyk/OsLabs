
provider "aws"{
    access_key = "AKIAXVBOTJLIBAIHJYXP"
    secret_key = "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"
    region = "eu-central-1"
}

resource "aws_instance" "my_ubuntu"{
    ami = "ami-09042b2f6d07d164a"
    instance_type = "t2.micro"
    security_groups =  [aws_security_group.sg.name]
    key_name = "ssh_key"
    user_data = "${file("apache.sh")}"
    tags = {
        Name = "lab4"
    }
}

resource "aws_security_group" "sg" {
    name = "scr-grp"
 
    #http
    ingress {
        from_port = 80
        protocol = "tcp"
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"]
    }
    #https
    ingress {
        from_port = 443
        protocol = "tcp"
        to_port = 443
        cidr_blocks = ["0.0.0.0/0"]
    }
     ingress {
        from_port = 22
        protocol = "tcp"
        to_port = 22
        cidr_blocks = ["0.0.0.0/0"]
    }
    

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}

resource "aws_key_pair" "keys" {
    key_name = "ssh_key"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEoTzFnqTIR4jkZ3FzthXdQTP0Qkhf5+a7HgGgtOVT3xoJd7dWcL18VaMX/6zhZT2jPqxOXLs4ezigdfxfPeYrQP5vFoxiyb0H6T/NPerDTZnl0keq1/u//8S0mS5M4otXJM32bHmhFJDW2NjyL30LRUPz9RN7wq4uRj2f8ll8Ep3Bi5AHjNzoED2IC8YPAm7FPbOjBClfBdGLO9jWvemb+B1NZBRo4Cdip/WQRKNwv+wZzQv13tw9Gij4zCJRdQEbugyhtcwrN/G4jJRAXaejdubJwkFL3oNdMU/ysQ4Mj969QtIGjEQiC5pvGn3SonSGr5JevukfILy4AiJn0bMz alex@alex-VirtualBox"
}
