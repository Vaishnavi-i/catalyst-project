pipeline {
     agent any
        environment {
        //once you sign up for Docker hub, use that user_id here
        registry = "vaishnavigi/cat"
        //- update your credentials ID after creating credentials for connecting to Docker Hub
        registryCredential = 'dockerhub'
        dockerImage = ''
    }
    stages {
        stage ('checkout') {
            steps {
            checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github_cred', url: 'https://github.com/Vaishnavi-i/catalyst-project']])
            }
        }
       
     stage ('Build docker image') {
            steps {
                sh 'docker build -t vaishnavigi/cat .'
            }
        }
     stage('Login') {
            steps {
                sh 'echo dckr_pat_-kvmrmrn70zR48J1-1PbvCGrx4g | docker login -u vaishnavigi --password-stdin'
           }
        }
     stage('Push') {
            steps {
                sh 'docker push vaishnavigi/cat'
           }
         }
   
    stage('Deploy to Kubernetes') {
            environment {
                KUBECONFIG = credentials('k8s_cred') // Kubernetes configuration stored as credentials
                DEPLOYMENT_FILE = 'deployment.yaml' // Path to your deployment.yaml file
            }
            steps {
                script {
                    // Set kubeconfig for kubectl
                    withCredentials([file(credentialsId: 'k8s_cred', variable: 'KUBECONFIG')]) {
                        sh "kubectl --kubeconfig=$KUBECONFIG apply -f $DEPLOYMENT_FILE"
                    }
                }
            }
        }
  
    }  
}
