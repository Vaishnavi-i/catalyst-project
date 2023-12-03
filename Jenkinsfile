pipeline {
     agent {
         label 'jenkin_pipeline'
     }
        environment {
        //once you sign up for Docker hub, use that user_id here
        registry = "vaishnavigi/catalyst"
        //- update your credentials ID after creating credentials for connecting to Docker Hub
        registryCredential = 'dockerhub'
        dockerImage = ''
    }
    stages {
        stage ('checkout') {
            steps {
            checkout([$class: 'GitSCM', branches: [[name: 'main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/Vaishnavi-i/catalyst-project']]])
            }
        }
       
        stage ('Build docker image') {
            steps {
                script {
                dockerImage = docker.build registry
                }
            }
        }
       
         // Uploading Docker images into Docker Hub
    stage('Upload Image') {
     steps{   
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
            }
        }
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
