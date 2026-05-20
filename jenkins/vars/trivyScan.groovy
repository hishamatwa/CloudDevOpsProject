def call(String imageName, String imageTag) {
    sh """
        trivy image ${imageName}:${imageTag}
    """
}
