pipeline {
    agent any

    parameters {
        string(name: 'IMAGE_NAME', defaultValue: 'kenn_im', description: 'Insert image name')
        string(name: 'CONTAINER_NAME', defaultValue: 'kenn_cont', description: 'Insert container name') 
        string(name: 'PORT', defaultValue: '2024', description: 'Port to expose')
    }

    stages {
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
                    // Stop and remove any existing container with the same name
                    sh """
                        docker stop ${params.CONTAINER_NAME} || true
                        docker rm ${params.CONTAINER_NAME} || true
                    """
                    // Run the container
                    sh """
                        docker run -d --name ${params.CONTAINER_NAME} ${params.IMAGE_NAME}:latest
                    """
                    // List contents of the application directory in the running container
                    sh """
                        docker exec ${params.CONTAINER_NAME} ls /var/www/html
                    """
                }
            }
        }

        stage('Deploy the application') {
            steps {
                script {
                    // Deploy the container with port mapping
                    sh """
                        docker run -d -p ${params.PORT}:80 --name ${params.CONTAINER_NAME} ${params.IMAGE_NAME}:latest
                    """
                }
            }
        }
    }

    post {
        always {
            script {
                // Cleanup containers
                sh """
                    docker stop ${params.CONTAINER_NAME} || true
                    docker rm ${params.CONTAINER_NAME} || true
                """
            }
        }
    }
}
