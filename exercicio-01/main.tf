module "slackoapp" {
    source = "./modules/slacko-app"
    vpc_id = data.aws_vpc.my-vpc.id
    ami = data.aws_ami.slacko-app.id
    subnet_cidr = "10.0.102.0/24"
    prefix_name = "Exercicio-01"
    tags = {
	Curso = "MBA"
        Faculdade = "Impacta"
        Aluno = "Mario"
        Turma = "CLC"
	}
    your_ssh_key = "Your ssh key"
    shape_app = "t2.micro"
    shape_mongo = "t2.small"
}

output "slackip" {
    value = module.slackoapp.slacko-app
}

output "mongodb" {
    value = module.slackoapp.slacko-mongodb
}

