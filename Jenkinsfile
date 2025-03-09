pipeline{

    agent any
// not sure about the env right now
    environment{
        REGISTRY_CREDENTIALS = 'docker-hub-credentials'
        IMAGE_NAME = "2023PHOENIX/spring-boot-pipeline"
    }

    stages{
        stage('Checkout Code'){
            steps{
            git branch: 'master', url : "https://github.com/2023PHOENIX/spring-boot-pipeline"
            }
        }
        stage('Build & Test'){
            steps{
            sh './mvnw clean package'
            }
        }

        stage('Build the docker image'){
            steps{

               sh "docker build -t ${IMAGE_NAME}:latest ."
            }
        }

        stage('Push the docker image'){
        steps{
            withDockerRegistry([credentialsId : REGISTRY_CREDENTIALS, url : "https://index.docker.io/v1/"]){
            sh "docker push ${IMAGE_NAME}:latest"
            }
        }
        }

    }
}