pipeline{
    agent any
    environment{
        aws_version=sh(script: "aws --v | awk '{print \$1}' | cut -d '/' -f 1", returnStdout: true).trim()
        //tf_version=sh(script: "terraform -v | head -1 | awk {'print \$1'}", returnStdout: true).trim()
    }
    stages {
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
        stage('Terraform init for S3'){
            steps{
                sh 'cd private-key && terraform init'
            }
        }
        stage('Terraform validate for S3'){
            steps{
                sh 'cd private-key && terraform validate'
            }
        }
        stage('Terraform Plan for S3'){
            steps{
                sh 'cd private-key && terraform plan'
                
            }
        }
        stage('Terraform apply for S3'){
            steps{
               sh 'cd private-key && terraform apply -auto-approve'
               
            }
        }
    }
       
}
