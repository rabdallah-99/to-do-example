pipeline {
  
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('rihamm80-dockerhub')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t riham80/rabdalla:latest .'
        
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
       
      }
    }
    stage('Push') {
      steps {
        sh 'docker push riham80/rabdalla:latest'
       
      }
    }
  }
  post {
    always {
      sh 'docker logout'
      
    }
  }
}
