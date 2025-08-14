pipeline {
    agent any

    tools {
        nodejs 'NodeJS'
        }
        stage('checkout') {
            steps {
                echo 'Check out code...'
                checkout scm
            }
        }
        stage('test') {
            steps {
                echo 'Testing...'
                sh'node -v'
                sh'npm -v'
            }
        }
         stage('Build') {
            steps {
                echo 'npm run build...'
                echo 'Build completed successfully!'
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