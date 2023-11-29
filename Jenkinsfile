pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t vaishnavigi/Devops .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo dckr_pat_-kvmrmrn70zR48J1-1PbvCGrx4g | docker login -u vaishnavigi --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push vaishnavigi/Devops'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
