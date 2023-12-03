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
                sh 'docker push vaishnavigi/devops'
           }
         }
   
    stage ('K8S Deploy') {
        steps {
            script {
                kubernetesDeploy(
                    configs: 'deployment.yaml',
                    kubeconfigId: 'k8s_cred',
                    enableConfigSubstitution: true
                    )           
               
            }
        }
    }
  
    }  
}
