def call(String imageName, String imageTag, String repositoryUri) {
    sh """
        docker tag ${imageName}:${imageTag} ${repositoryUri}:${imageTag}
        docker push ${repositoryUri}:${imageTag}
    """
}

