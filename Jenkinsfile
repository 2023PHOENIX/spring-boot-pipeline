pipeline{

    agent any
// not sure about the env right now
    environment{
        REGISTRY_CREDENTIALS = 'docker-hub-credentials'
        IMAGE_NAME = "spring-boot-pipeline-x01"
    }

    stages{
        stage('Checkout Code'){
            steps{

            echo "checking out the code "

            git branch: 'master', url : "https://github.com/2023phoenix/spring-boot-pipeline"
            }
        }
        stage('Build & Test'){
            steps{
            sh './mvnw clean package'
            }
        }

        stage('Build the docker image'){
            steps{
                echo "Building project ${IMAGE_NAME}"
               sh "docker build -t ${IMAGE_NAME}:latest ."
            }
        }

        stage('Push the docker image'){
        steps{
            echo "docker push ${IMAGE_NAME}:latest"
            withDockerRegistry([credentialsId : REGISTRY_CREDENTIALS, url : "https://index.docker.io/v1/"]){
            sh "docker push ${IMAGE_NAME}:latest"
            }

            echo "docker image is pushed"
        }
        }

    }
}