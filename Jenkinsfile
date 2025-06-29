pipeline {
  agent any

  environment {
    AWS_ACCESS_KEY_ID     = credentials('AKIAVV6FWKWE2BRFQK5F')
    AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
  }

  stages {
    stage('Checkout') {
      steps {
        git 'https://github.com/YOUR_GITHUB_USER/YOUR_REPO.git'
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
          input message: 'Approve Terraform Apply?'
          sh 'terraform apply -auto-approve -var-file="terraform.tfvars"'
        }
      }
    }
  }
}
