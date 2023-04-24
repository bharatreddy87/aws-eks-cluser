pipeline{
    agent any
    environment{
        aws_version=sh(script: "aws --v | awk '{print $1}' | cut -d '/' -f 1", returnStdout: true).trim()
        tf_version=sh(script: "terraform.exe -v | head -1 | awk {'print $1'}", returnStdout: true).trim()
    }
    stages{
        stage{
            when{
                expression{
                    if ( aws_version=="aws-cli" ) {
                        return false 
                    }   
                    else{
                        return true
                    }                      
                }
            }
            steps{
                sh 'curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"'
                sh 'unzip awscliv2.zip'
                sh 'sudo ./aws/install'
            }            
        }
    }
}
