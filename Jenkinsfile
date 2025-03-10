pipeline {
    agent {
        docker {
            image 'maven:3.8.6-openjdk-11'
        }
    }

    environment {
        REGISTRY_CREDENTIALS = 'docker-hub-credentials'
        IMAGE_NAME = "spring-boot-pipeline-x01"
        DOCKER_HUB_URL = "https://index.docker.io/v1/"
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo "Checking out the code"
                git branch: 'master', url: "https://github.com/2023phoenix/spring-boot-pipeline"
            }
        }

        stage('Build & Test') {
            steps {
                echo "Building and testing the application"
                sh './mvnw clean package'
            }
        }

        stage('Build the Docker Image') {
            steps {
                echo "Building Docker image: ${IMAGE_NAME}"
                sh "docker build -t ${IMAGE_NAME} -t ${IMAGE_NAME}:latest ."
            }
        }

        stage('Push Docker Image') {
            steps {
                echo "Pushing Docker image to Docker Hub"
                withDockerRegistry([credentialsId: REGISTRY_CREDENTIALS, url: DOCKER_HUB_URL]) {
                    sh "docker push ${IMAGE_NAME}"
                    sh "docker push ${IMAGE_NAME}:latest"
                }
                echo "Docker image pushed successfully"
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully!"
        }
        failure {
            echo "Pipeline failed! Please check the logs."
        }
    }
}
