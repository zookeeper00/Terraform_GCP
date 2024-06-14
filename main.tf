# Configure the Google Cloud provider

provider "google" {

  project     = "testing-project-419916"

  region      = "us-central1"  # Choose your desired region

  credentials = file("/home/ushaikh8446/testing-project-419916-91c5c149fb44.json")

}

# Define a virtual network

resource "google_compute_network" "vpc_network" {

  name = "terraform-vpc"

}

# Define a subnet

resource "google_compute_subnetwork" "subnetwork" {

  name          = "terraform-subnet"

  ip_cidr_range = "10.0.0.0/16"

  network       = google_compute_network.vpc_network.id

  region        = "us-central1"  # Same region as the network

}

# Define a firewall rule to allow SSH

resource "google_compute_firewall" "firewall_ssh" {

  name    = "allow-ssh"

  network = google_compute_network.vpc_network.name

  allow {

    protocol = "tcp"

    ports    = ["22"]

  }

  source_ranges = ["0.0.0.0/0"]

}

# Define a Compute Engine instance (VM)

resource "google_compute_instance" "vm_instance" {

  name         = "terraform-instance"

  machine_type = "e2-medium"  # Choose the machine type

  zone         = "us-central1-a"  # Choose the zone

  boot_disk {

    initialize_params {

      image = "debian-cloud/debian-11"  # Choose your desired image

    }

  }

  network_interface {

    network    = google_compute_network.vpc_network.id

    subnetwork = google_compute_subnetwork.subnetwork.id

    access_config {

      # Ephemeral IP

    }

  }

  metadata_startup_script = <<-EOF

    #!/bin/bash

    echo "Hello, World!" > /var/www/html/index.html

    EOF

}
