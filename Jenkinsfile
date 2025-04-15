pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Zeris72/ZIO', branch: 'main'
            }
        }

        stage('Build & Test') {
            steps {
                sh '''
                    chmod +x build.sh
                    ./build.sh
                '''
            }
        }
        
        stage('Publish Test Results') {
            steps {
                junit allowEmptyResults: true, testResults: '**/TEST-*.xml'
            }
        }
        stage('SonarQube Analysis') {
    steps {
        withSonarQubeEnv('MySonar') {
            sh '''
                sonar-scanner \
                  -Dsonar.projectKey=ZIO \
                  -Dsonar.sources=src \
                  -Dsonar.java.binaries=out
            '''
        }
    }
}
    }

    post {
        success {
            echo '✅ Build zakończony sukcesem!'
        }
        failure {
            echo '❌ Coś poszło nie tak.'
        }
    }
}
