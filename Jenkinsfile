pipeline{
    agent any
    environment{
        aws_version="$(aws --v | awk '{print $1}' | cut -d '/' -f 1)"
        tf_version="$(terraform.exe -v | head -1 | awk {'print $1'})"
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
