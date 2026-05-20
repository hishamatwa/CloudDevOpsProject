def call(String imageName, String imageTag, String repositoryUri) {
    sh """
        docker rmi ${imageName}:${imageTag} || true
        docker rmi ${repositoryUri}:${imageTag} || true
    """
}

