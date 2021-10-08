module "mod_jenkins" {
    source = "./modules/mod_jenkins"
    vpc_id = data.aws_vpc.my-vpc.id
    ami = data.aws_ami.ubuntu.id
    
    subnet_cidr = "10.0.102.0/24"
    prefix_name = "Exercicio-02"
    your_ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDLci3Uh2SzjAzX2WMhXRYB7jIPf7piMQb34wNibQg9MrE/gsvaWnlOMvR8clsyPTFAJBOnuHQor50IsKnoptMdM/RpKUbCMxHWwdLcuRhDH2AjFX7f64ecRYQMREZawWq3f2JoEZRHgMwdZdVDKid0ECXQSPZVz5j888xgmPwqU55QQiJsn0uzsLd5eFnmHT9kh1kYUSuyue7O8fMDkJDkFq15NlX5ZirDk1xyRXwQINgpOc5zYy3kA1OQc8SW1YvkZ2+mec25fCrgyqFVqEiCpJDs/7B5Ki1k0VeTOY9Ahq1lkkOqAuwNrX4/JLX+e0mZ+pjb7bAFDI2iWoDvTTojuW4nW8pRlCHFgjf2U2UEInngrYzTy4iH2ab6QZe3pQPQ1WNMYnZIxoVwBHNY8S4KXxS/iJ8ZXfA6HdrsEUSspdIilRg7f4LCY+qrpPD/6rWGYdI74wzQzB86lyPmJyi8dVaxBf7tzMYYlVdINOmTuAjDbnqlz99lef4ue3sKuuc= mario@ubuntu"
    shape_app = "t2.small"
    tags = {
        Curso = "MBA"
        Faculdade = "Impacta"
        Aluno = "Mario"
        Turma = "CLC-06"
    }
}

resource "null_resource" "PassJenkins" {
    triggers = {
        instance = module.mod_jenkins.jenkins-app
    }
    connection {
        type = "ssh"
        user = "ubuntu"
        private_key = file("${path.module}/modules/mod_jenkins/files/id_jenkins")
        host = module.mod_jenkins.jenkins-app
    }
    provisioner "remote-exec" {
    inline = [
        "echo 'Estamos preparando o Jenkins Aguarde...'",
        "sleep 40",
        "echo 'Ainda estamos aqui... Espere mais um pouco !!!'",
        "sleep 190",
        "echo 'Agora está quase acabando, menos de 1 minuto!!!'",
        "sleep 40",
        "sudo cat /var/lib/jenkins/secrets/initialAdminPassword",
    ]
  }
}

output "jenkinsIP" {
    value = module.mod_jenkins.jenkins-app
}

