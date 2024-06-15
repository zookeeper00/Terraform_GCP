terraform {
  backend "gcs" {
    bucket  = "backend_terraform_805032"  # Replace with your bucket name
    prefix  = "terraform/state"          # This is the directory in the bucket where the state file will be stored
  }
}
