pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
 ''' environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }'''
  stages {
    '''stage('Build') {
      steps {
        sh 'docker build -t vaishnavigi/devops .'
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
    }'''
    stage('Deploy to Kubernetes') {
            steps {
                // Apply Kubernetes manifests using kubectl
                script {
                    def kubeconfig = '$HOME/.kube/config' // Path to your kubeconfig file
                    def namespace = 'default' // Kubernetes namespace
                    def deploymentFile = '/etc/kubernetes/manifests/deployment.yaml' // Path to your deployment YAML file
                    def serviceFile = '/etc/kubernetes/manifests/service.yaml' // Path to your service YAML file

                     sh "kubectl apply -f /etc/kubernetes/manifests/service.yaml"
                    //sh "kubectl --kubeconfig=${kubeconfig} apply -f ${deploymentFile}"
                    sh "kubectl --kubeconfig=${kubeconfig} apply -f ${serviceFile}"
                }
            }
        }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
