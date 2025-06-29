pipeline {
  agent any

  parameters {
    choice(
      name: 'ACTION',
      choices: ['apply', 'destroy'],
      description: 'Choose Terraform action'
    )
  }

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
          sh "terraform plan -var-file=\"terraform.tfvars\""
        }
      }
    }

stage('Terraform Action') {
  steps {
    dir('envs/dev') {
      script {
        if (params.ACTION == 'apply') {
          echo "Running terraform apply..."
          sh "terraform apply -auto-approve -var-file=\"terraform.tfvars\""
        } else if (params.ACTION == 'destroy') {
          echo "Running terraform destroy..."
          sh "terraform destroy -auto-approve -var-file=\"terraform.tfvars\""
        }
      }
    }
  }
}
