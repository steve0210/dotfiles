pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                git branch: 'main', credentialsId: '868a65c9-9ad7-48a0-b454-364c2f9cc8f0', url: 'git@github.com:SHUSA/labis_db_seed.git'
            }
        }
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
    }
}
