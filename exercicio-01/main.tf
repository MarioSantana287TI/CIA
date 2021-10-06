module "slackoapp" {
    source = "./modules/slacko-app"
    vpc_id = data.aws_vpc.my-vpc.id
    ami = data.aws_ami.slacko-app.id
    subnet_cidr = "10.0.102.0/24"
    prefix_name = "Exercicio-01"
    your_ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDFyEp/yNg7euy5jq5dMLGO0DtogLDA0VbP9DDJnmHgNd2d6VCbzB/f4J++BvZbFv9qd6LZbMo2KibqH4GnisNW3VfyuNcsW4s9Izx/kfyxqze35aIjYCLoM3QgfiChTfJK7mwOl+6Ce1/+Kql87zfthik9MVVG8H/QNme8/JGgaJBVFCp5lwUXgg5awAmRFKO7tdJRGQ/rQaIFD3MqQjdXO5vPgx/oPHshD9lsER6mR+4P6rNIqdIBInVwPk7Mkk+3OcrOBwq3Um9g0ZfUSYI0f6jErP2v1PHPVG/V4UAYEDuQzPwgdaU4Cdjt7iLnYD4ln5eziuaZPtWVi/i6fRokoWEOSLpxDluuIGL9Cn60CvqxZoN5fJ8cU+MMXkbCjVnwgMaeDdWAhK01WHXrk0C4ODFzsksC8hoCU0NhyIzyIE/5vw0KmKVHZ1jHqSrSLkOL8i4L7xQ12OYOZz9g1mr6t4NT7IYYQ8VJifCSXXx/e8hQZPP96q1en2q5PvOg5M8= mario@ubuntu"
    shape_app = "t2.micro"
    shape_mongo = "t2.small"
}

output "slackip" {
    value = module.slackoapp.slacko-app
}

output "mongodb" {
    value = module.slackoapp.slacko-mongodb
}

