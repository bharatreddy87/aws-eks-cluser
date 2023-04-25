pipeline {

    parameters{
		//string(name:'Deploy_Env', defaultValue: 'Production', description:'Production Enveronment')
		//booleanParam(name:'PROD', defaultValue: true, description: 'prod env')
		//choice(name:'branches', choices:['main','stage','qa','dev'], description:'need to selete the deployable branch')
		//file(name:'codefiles', description: 'production files')
		//password(name:'prodpasswd', defaultValue:'Hanuman@3', description:'password for prod login')
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
	}
	options{
		//buildDiscarder(logRotator((numToKeepStr: '2'))
		disableConcurrentBuilds()
	        timeout(time: 200, unit: 'SECONDS') 
	}
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

   agent  any
    stages {
        stage('checkout') 
            steps {
		    cleanWs()
		    checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/bharatreddy87/aws-eks-cluser.git']]])
            }
        }           

        stage('Plan') {
            steps {
                sh 'pwd;cd private-key ; terraform init'
                sh "pwd;cd private-key ; terraform plan -out tfplan"
                sh 'pwd;cd private-key ; terraform show -no-color tfplan > tfplan.txt'
            }
        }
        stage('Approval') {
           when {
               not {
                   equals expected: true, actual: params.autoApprove
               }
           }

           steps {
               script {
                    def plan = readFile 'private-key/tfplan.txt'
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
               }
           }
       }

        stage('Apply') {
            steps {
                sh "pwd;cd private-key ; terraform apply -input=false tfplan"
            }
        }

        stage('EKS-init'){
            steps{
                sh 'pwd; terraform init'
                sh "pwd; terraform plan -out tfplan"
                sh 'pwd; terraform show -no-color tfplan > tfplan.txt'
            }
        }
        stage('EKS-Approval') {
           when {
               not {
                   equals expected: true, actual: params.autoApprove
               }
           }

           steps {
               script {
                    def plan = readFile 'tfplan.txt'
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
               }
           }
       }
       stage('EKS-Apply') {
            steps {
                sh "pwd; terraform apply -input=false tfplan"
            }
        }

    }
}
