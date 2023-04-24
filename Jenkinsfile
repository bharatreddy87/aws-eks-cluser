pipeline{
    agent any
    environment{
        aws_version=sh(script: "aws --v | awk '{print \$1}' | cut -d '/' -f 1", returnStdout: true).trim()
        tf_version=sh(script: "terraform -v | head -1 | awk {'print \$1'}", returnStdout: true).trim()
    }
    stages {
        stage('Install Terraform') {
            when {
                expression {
                    if (tf_version=="Terraform") {
                        return true
                    } else {
                        return false
                    }
                }
            }
            steps {
                // some steps to execute
                sh 'sudo yum install -y yum-utils shadow-utils'
                sh 'sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo'
                sh 'sudo yum -y install terraform'

            }
        }
        stage('Install AWS') {
            when {
                expression {
                    if (aws_version=="aws-cli") {
                        return true
                    } else {
                        return false
                    }
                }
            }
            steps {
                // some steps to execute
                sh 'curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"'
                sh 'unzip awscliv2.zip'
                sh './aws/install --update'
                sh 'aws --version'

            }
        }
  
    }
}
