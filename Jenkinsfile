pipeline {
    agent any

    tools {
        nodejs 'NodeJS'
        }
        stage('checkout') {
            steps {
                
                checkout scm
            }
        }
        stage('test') {
            steps {
               
                sh 'node -v'
                sh 'npm -v'
            }
        }
         stage('Build') {
            steps {
                sh 'npm run build'
               
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