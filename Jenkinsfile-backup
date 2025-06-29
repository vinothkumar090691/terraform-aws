pipeline {
  agent any

  environment {
    AWS_ACCESS_KEY_ID     = credentials('aws-jenkins-creds')
    AWS_SECRET_ACCESS_KEY = credentials('aws-jenkins-creds')
  }

  stages {
    stage('Checkout Code') {
      steps {
        git branch: 'main', url: 'https://github.com/vinothkumar090691/terraform-aws.git'
      }
    }

    stage('Terraform Init') {
      steps {
        dir('envs/dev') {
          sh 'terraform init'
        }
      }
    }

    stage('Terraform Plan') {
      steps {
        dir('envs/dev') {
          sh 'terraform plan -var-file="terraform.tfvars"'
        }
      }
    }

    stage('Terraform Apply') {
      steps {
        dir('envs/dev') {
          input message: "Apply EC2 instance?"
          sh 'terraform apply -auto-approve -var-file="terraform.tfvars"'
        }
      }
    }
  }
}
