pipeline {
  environment {
    registry = "dockervaru/thisisdmg"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
  tools {nodejs "node" }
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/varunvelayudhan/simple-node-js-react-npm-app.git'
      }
    }
    stage('Build') {
       steps {
         sh 'npm install'
       }
    }
     

    stage('Test') {
       environment {
            CI = 'true'
        }

                steps {
        sh 'npm test'
      }
    }
    
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
  }
