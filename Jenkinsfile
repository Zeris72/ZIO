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
