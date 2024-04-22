# Include the variables file
terraform {
  required_version = ">= 0.12"
}

# Define a VPC network
resource "google_compute_network" "my_network" {
  name = var.vpc_name
}

# Define a public subnet within the VPC
resource "google_compute_subnetwork" "public_subnet" {
  name          = var.public_subnet
  region        = var.cluster_region
  network       = google_compute_network.my_network.name
  ip_cidr_range = var.public_subnet_cidr
}

# Define a private subnet within the VPC
resource "google_compute_subnetwork" "private_subnet" {
  name          = var.private_subnet
  region        = var.cluster_region
  network       = google_compute_network.my_network.name
  ip_cidr_range = var.private_subnet_cidr
}

# Define a firewall rule to allow incoming HTTP, HTTPS, and SSH traffic
resource "google_compute_firewall" "allow_traffic" {
  name    = "allow-traffic"
  network = google_compute_network.my_network.name

  allow {
    protocol = "tcp"
    ports    = var.firewall_allowed_ports
  }

  source_ranges = var.firewall_source_ranges
}

# Define a Dataproc cluster
resource "google_dataproc_cluster" "rcb-ipl-2024-dataproc" {
  name   = var.cluster_name
  region = var.cluster_region

  cluster_config {
    master_config {
      num_instances = 1
      machine_type  = var.master_machine_type
      disk_config {
        boot_disk_type    = "pd-ssd"
        boot_disk_size_gb = var.boot_disk_size_gb
      }
    }

    worker_config {
      num_instances    = var.num_workers
      machine_type     = var.worker_machine_type
      disk_config {
        boot_disk_size_gb = var.boot_disk_size_gb
      }
    }

    preemptible_worker_config {
      num_instances = 0
    }
  }
}

