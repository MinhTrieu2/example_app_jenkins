pipeline {
    agent any

    tools {
        nodejs 'NodeJs'   // Tên phải đúng với Global Tool Configuration
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
                sh 'docker build -t my-node-app:1.0 .'
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
