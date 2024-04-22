provider "google" {
  credentials = file("/home/ushaikh8446/testing-project-419916-9ed594364281.json")  
  project = "testing-project-419916" # GCP Project ID
  region  = "us-central1"              # Region where resources will be deployed
}

