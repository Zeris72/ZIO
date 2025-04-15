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
        mail to: 'uterek58@gmail.com',
             subject: "✅ Build SUCCESS: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
             body: "Build zakończył się sukcesem.\n\nZobacz: ${env.BUILD_URL}"
    }
    failure {
        mail to: 'uterek58@gmail.com',
             subject: "❌ Build FAILED: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
             body: "Build się nie powiódł.\n\nZobacz logi: ${env.BUILD_URL}"
    }
}
}
