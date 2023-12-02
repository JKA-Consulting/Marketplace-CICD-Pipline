provider "google" {
  project = "themarketplacedev"
  region  = "europe-west1"
}

resource "google_compute_network" "marketplace-vpc" {
  name                    = "marketplace-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet-2" {
  name          = "subnet-2"
  network       = google_compute_network.marketplace-vpc.self_link
  ip_cidr_range = "10.20.2.0/24"  # Replace with your desired IP range
}

resource "google_compute_instance" "webmail-instance" {
  name         = "webmail-instance"
  machine_type = "e2-micro"
  zone         = "europe-west1-d"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 20 # Boot disk size in GB
    }
  }

  network_interface {
    network = google_compute_network.marketplace-vpc.name
    subnetwork = google_compute_subnetwork.subnet-2.name
    
  }
}

resource "google_compute_firewall" "allow-ssh-rdp-icmp" {
  name    = "allow-ssh-rdp-icmp"
  network = google_compute_network.marketplace-vpc.name 

  allow {
    protocol = "tcp"
    ports    = ["22", "3389", "80"] #allowing ssh, rdp and http
  }

  allow {
    protocol = "icmp"  #allowing pings
  }

  source_ranges = ["0.0.0.0/0"] #allowing incoming traffic from the specified network address, in this case all addresses are allowed
}
