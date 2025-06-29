pipeline {
  agent any

  environment {
    AWS_CREDS = credentials('AKIAVV6FWKWE2BRFQK5F') // Use your actual Jenkins credential ID
  }

  stages {
    stage('Set AWS Environment') {
      steps {
        script {
          env.AWS_ACCESS_KEY_ID     = "${env.AWS_CREDS_USR}"
          env.AWS_SECRET_ACCESS_KEY = "${env.AWS_CREDS_PSW}"
        }
      }
    }

    stage('Checkout Code') {
      steps {
        git 'https://github.com/vinothkumar090691/terraform-aws.git'
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
