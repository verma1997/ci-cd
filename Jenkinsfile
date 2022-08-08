pipeline {
    agent any
    environment {
      tag = '${SHORT_SHA}'
    }
    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }
        stage('Build Image') {
            steps {
                echo 'Building Docker Image'
                // sh 'sudo chmod 666 /var/run/docker.sock'
                script {
                    Image = docker.build("searce-playground-v1/python-app")
                }
            }
        }
        stage('Push Updated Image') {
            steps {
                echo 'Pushing Docker Image'
                script {
                    docker.withRegistry('https://gcr.io', 'gcr:searce-playground-v1') {
                    Image.push("latest")
                    Image.push(tag)
                    }
                }    
            }
        }
    }
}
