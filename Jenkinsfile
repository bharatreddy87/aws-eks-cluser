pipeline{
    agent any
    environment{
        aws_version=sh(script: "aws --v | awk '{print \$1}' | cut -d '/' -f 1", returnStdout: true).trim()
        //tf_version=sh(script: "terraform -v | head -1 | awk {'print \$1'}", returnStdout: true).trim()
    }
    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/bharatreddy87/aws-eks-cluser.git']]])
            }
        }
        stage('Tool Installation') {
            parallel {
                stage('Install Terraform') {
                      steps {
                            // some steps to execute
                            sh 'sudo yum install -y yum-utils shadow-utils'
                            sh 'sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo'
                            sh 'sudo yum -y install terraform'
                            sh 'sudo terraform -v'
                            }
                }
                stage('Install AWS') {
                      steps {
                        // some steps to execute
                        sh 'sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"'
                        sh 'sudo unzip awscliv2.zip'
                        sh 'sudo ./aws/install --update'
                        sh 'sudo aws --version'
                        }
                    }
                }
            }
         stage('Init') {
            steps {
                sh ' && cd private-key && terraform init'
            }
        }
        stage('Plan') {
            steps {
                sh ' cd private-key && terraform plan'
            }
        }
        stage('Apply') {
            steps {
                sh 'cd private-key && terraform apply -auto-approve'
            }
        }
               
            }
        }
    }
       
}
