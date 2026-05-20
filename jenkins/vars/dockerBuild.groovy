def call(String imageName, String imageTag) {
    sh """
        docker build -t ${imageName}:${imageTag} -f docker/Dockerfile .
    """
}

