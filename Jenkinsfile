pipeline{

    agent any
// not sure about the env right now
    environment{
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

//         stage('Build the docker image'){
//             steps{
//
//                sh "docker build -t ${IMAGE_NAME}:latest"
//             }
//         }

    }
}