terraform {
 backend "gcs" {
   bucket  = "backend_terraform_8050"
   prefix  = "terraform/state"
 }
}
