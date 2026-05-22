module "network" {
  source                = "../../modules/network"
  private_subnet_cidr_1 = "10.0.2.0/24"
  vpc_cidr              = "10.0.0.0/16"
  public_subnet_cidr_1  = "10.0.1.0/24"
  availability_zone_1   = "eu-north-1a"
  private_subnet_cidr_2 = "10.0.3.0/24"
  private_subnet_cidr_3 = "10.0.4.0/24"
  availability_zone_2   = "eu-north-1b"
  availability_zone_3   = "eu-north-1c"
}

module "ecr" {
  source = "../../modules/ecr"

  repository_name = "cloud-devops-app"
}
module "jenkins_server" {
  source = "../../modules/jenkins-server"

  vpc_id           = module.network.vpc_id
  public_subnet_id = module.network.public_subnet_id
  ami_id           = "ami-0e8a0f9c86eecd7ed"
  instance_type    = "t3.micro"
}

module "eks" {
  source = "../../modules/eks"

  private_subnet_ids = module.network.private_subnet_ids
}
