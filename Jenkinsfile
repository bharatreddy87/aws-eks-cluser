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

         stage('Init') {
            steps {
                sh 'cd private-key && terraform init'
            }
        }
        stage('Plan') {
            steps {
                sh 'cd private-key && terraform plan'
            }
        }
        stage('Apply') {
            steps {
                sh 'cd private-key && terraform apply -auto-approve'
            }
        }
               
    }
}
        
    
       
