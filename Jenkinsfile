pipeline {
  agent any
      options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('rihamm80-dockerhub')
    CREATE_SCHEMA = "true"
        DATABASE_URI = credentials("DATABASE_URI")
        SECRET_KEY = credentials("SECRET_KEY")
  }
  stages {
    stage('setup') {
            steps {
                sh ' bash ./setup.sh'
            } //steps close
       }
    stage('Database creation') {
            steps {
                script{
                    if (env.CREATE_SCHEMA == "true") {
                        sh ' bash database.sh'
                    }
                }

            }
        }
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
