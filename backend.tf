terraform {
  backend "gcs" {
    bucket  = "sample-6212024"  # Replace with your bucket name
    prefix  = "terraform-my-project/state"          # This is the directory in the bucket where the state file will be stored
  }
}
