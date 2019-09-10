terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "klambert"

    workspaces {
      name = "tf-cloud"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "database" {
  source = "../../../modules/data-stores/mysql"

  db_name       = "stagedb"
  storage_size  = 10
  instance_type = "db.t2.micro"
  db_password   = var.db_password
}