pipeline {
    agent any
    parameters {
        string name: 'IMAGE_NAME', defaultValue: ' ', description: 'insert image name'
        string name: 'CONTAINER_NAME', defaultValue: ' ', description: 'insert container name' 
        string name: 'PORT', defaultValue: ' ', description: 'port' 
        // name: 'IMAGE_NAME', string defaultValue: ' ', description: ' insert image name'  
        }


    stages {
        // stage('Clone the repository') {
        //     steps {
        //         script {
        //             sh """
        //                 git clone git@github.com:DEL-ORG/s8-web-2.git
        //             """
        //         }
        //     }
        // }

        stage('Building the image') {
            steps {
                script {
                    sh """
                        docker build -t ${params.IMAGE_NAME}:latest . || true
                        docker images
                    """
                }
            }
        }

        stage('Running the container to see its contents') {
            steps {
                script {
                    sh """
                        docker run -d --name ${params.CONTAINER_NAME} ${params.IMAGE_NAME} || true
                        docker exec ${params.CONTAINER_NAME} ls /var/www/html
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
