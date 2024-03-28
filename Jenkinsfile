pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                script {
                    // Check if Docker is available
                    sh 'sudo docker info'
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    // Build the Docker image from a Java file
                    sh 'sudo docker build -t my-java-app .'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Run a container using the Docker image
                    sh 'sudo docker run -d --name my-java-container my-java-app'
                    // Fetch the output of the java script
		    sh 'sudo ocker logs my-java-container'
                }
            }
        }
    }
}


