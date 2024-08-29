pipeline {
    agent any
    parameters {
        name: 'IMAGE_NAME', string defaultValue: ' ', description: ' insert image name'
        name: 'CONTAINER_NAME', string defaultValue: ' ', description: ' insert container name' 
        name: 'PORT', string defaultValue: ' ', description: ' port' 
        // name: 'IMAGE_NAME', string defaultValue: ' ', description: ' insert image name'  
        }


    stages {
        stage('Clone the repository') {
            steps {
                script {
                    sh """
                        git clone git@github.com:DEL-ORG/s8-web-2.git
                    """
                }
            }
        }

        stage('Building the image') {
            steps {
                script {
                    sh """
                        docker build -t ${params.IMAGE_NAME}:latest .
                        docker images
                    """
                }
            }
        }

        stage('Running the container to see its contents') {
            steps {
                script {
                    sh """
                        docker run -it --name ${CONTAINER_NAME} ${params.IMAGE_NAME} bash
                        ls
                    """
                }
            }
        }

        stage('deploy the application') {
            steps {
                script {
                    sh """
                        docker run -d -p ${PORT}:80 ${CONTAINER_NAME}
                    """
                }
            }
        }
    }  
}
