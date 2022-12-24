terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file("carbide.json")

  project = "carbide-crowbar-372401"
  region  = "us-central1"
  zone    = "us-central1-c"
}


resource "google_compute_instance" "builder" {
  name         = "buildteste"
  machine_type = "e2-micro"
  zone         = "us-central1-c"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

   network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
  
}

resource "random_id" "bucket_prefix" {
  byte_length = 8
}

resource "google_storage_bucket" "default" {
  name          = "${random_id.bucket_prefix.hex}-bucket-tfstate"
  force_destroy = false
  location      = "us"
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}

