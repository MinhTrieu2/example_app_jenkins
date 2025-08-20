pipeline {
    agent any

    tools {
        nodejs 'NodeJs'   // Tên phải đúng với Global Tool Configuration
    }
    environment {
        DOCKER_HUB_REPO = 'minhtrieun/test_push'
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Check out code...'
                checkout scm
            }
        }

        stage('Test') {
            steps {
                echo 'Testing...'
                sh 'node -v'
                sh 'npm -v'
            }
        }

        stage('Build') {
            steps {
                echo 'npm run build...'
                sh 'npm run build'
                echo 'Build completed successfully!'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ${DOCKER_HUB_REPO}:1.0 .'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'testpush', 
                    usernameVariable: 'DOCKER_USERNAME', 
                    passwordVariable: 'DOCKER_PASSWORD')]) 
                    {
                       sh '''
                       echo $DOCKER_PASSWORD docker login -u $DOCKER_USERNAME --password-stdin
                       docker push $DOCKER_HUB_REPO:1.0
                       docker logout
                       
'''
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
        }
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
