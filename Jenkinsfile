pipeline {
    agent any
    environment {
      tag = '${BUILD_NUMBER}'
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
                    Image = docker.build("<project-id>/priyanshu/go-app")
                }
            }
        }
        stage('Push Updated Image') {
            steps {
                echo 'Pushing Docker Image'
                script {
                    docker.withRegistry('https://gcr.io', 'gcr:<project-id>') {
                    Image.push(tag)
                    }
                }    
            }
        }
    }
}
