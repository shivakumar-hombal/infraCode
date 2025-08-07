pipeline {
    agent any

    environment {
        DOCKER_CREDS = credentials('docker-creds')
        IMAGE_NAME = 'shivakumarhombal/devops-test'
        TAG = "${BUILD_NUMBER}.0"
    }

    stages {
        stage('SCM Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/shivakumar-hombal/infraCode.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$TAG .'
            }
        }

        stage('login to dockerhub') {
            steps {
                sh 'echo $DOCKER_CREDS_PSW | docker login -u $DOCKER_CREDS_USR --password-stdin'
            }
        }

        stage('push image') {
            steps {
                sh 'docker push $IMAGE_NAME:$TAG'
            }
        }   
    }
    post {
        always {
            sh 'docker rmi -f $(docker images -q)'
            sh 'docker logout'
            sh 'docker run -it -d -p 127.0.0.1:8000:80 $IMAGE_NAME:$TAG'
        }
    }
}