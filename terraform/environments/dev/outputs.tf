output "ecr_repository_url" {
  value = module.ecr.repository_url
}

output "jenkins_public_ip" {
  value = module.jenkins_server.jenkins_public_ip
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}

