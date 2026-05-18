terraform {
  backend "s3" {
    bucket = "hisham-clouddevops-tf-state-2026"
    key    = "dev/terraform.tfstate"
    region = "eu-north-1"
  }
}
