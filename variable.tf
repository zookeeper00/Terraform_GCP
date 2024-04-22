# variable "project_id" {
#  description = "GCP Project ID"
#  type        = string
#}

#variable "region" {
#  description = "Region where resources will be deployed"
#  type        = string
#  default     = "us-central1"
#}

variable "vpc_name" {
  description = "VPC for Dataproc cluster"
  type        = string
  default     = "hadoop-vpc"
}

variable "public_subnet" {
  description = "Public Subnet for Dataproc cluster"
  type        = string
  default     = "public-subnet"
}

variable "private_subnet" {
  description = "Private Subnet for Dataproc cluster"
  type        = string
  default     = "private-subnet"
}

variable "public_subnet_cidr" {
  description = "The IP address range for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "The IP address range for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "firewall_allowed_ports" {
  description = "The ports to allow traffic on (HTTP, HTTPS, SSH)"
  type        = list(string)
  default     = ["80", "443", "22"]
}

variable "firewall_source_ranges" {
  description = "The source IP ranges (allow from anywhere)"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "cluster_name" {
  description = "The name of the Dataproc cluster"
  type        = string
  default     = "rcb-ipl-2024-dataproc"
}

variable "cluster_region" {
  description = "The region where the Dataproc cluster will be deployed"
  type        = string
  default     = "us-central1"
}

variable "master_machine_type" {
  description = "The machine type for the master node"
  type        = string
  default     = "e2-medium"
}

variable "num_workers" {
  description = "The number of worker nodes"
  type        = number
  default     = 2
}

variable "worker_machine_type" {
  description = "The machine type for the worker nodes"
  type        = string
  default     = "e2-medium"
}

variable "boot_disk_size_gb" {
  description = "The size of the boot disk (in GB)"
  type        = number
  default     = 30
}

