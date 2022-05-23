terraform {
  backend "s3"{
    region     = "ap-south-1"
    bucket     = "employeeportalbucket"
    key        = "terraform.tfstate"
    encrypt    = "false"
    profile    = "shireen_syed"
  }
}
