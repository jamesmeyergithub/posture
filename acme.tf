terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }
}

provider "google" {
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network" "example_network"{
  name                            = "example-network-1"
  delete_default_routes_on_create = false
  auto_create_subnetworks         = false
  routing_mode                    = "REGIONAL"
  mtu                             = 1000
  project                         = "iamdemok8"
}

resource "google_container_node_pool" "example_node_pool" {
  name               = "example-node-pool-1"
  cluster            = "example-cluster-1"
  project            = "iamdemok8"
  initial_node_count = 3

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
  }
}

resource "google_storage_bucket" "example_bucket" {
  name          = "example-bucket-1"
  location      = "EU"
  force_destroy = true

  project = "iamdemok8"

  uniform_bucket_level_access = false
}
