provider "google" {
  project = "themarketplacedev"
  region  = "europe-west2"
}

resource "google_compute_instance" "Compute_Instance_1" {
  name         = "Compute_Instance_1"
  machine_type = "e2-micro"
  zone         = "europe-west2-a"

  boot_disk {
    initialize_params {
      image = "projects/themarketplacedev/global/images/ubuntu-2304-lunar-amd64-v20231020"
      size  = 20 # Boot disk size in GB
    }
  }

  network_interface {
    network = "marketplace-vpc" 
    subnetwork = "subnet-1"
    
  }

resource "google_compute_firewall" "allow-ssh-rdp-icmp" {
  name    = "allow-ssh-rdp-icmp"
  network = "marketplace-vpc" 

  allow {
    protocol = "tcp"
    ports    = ["22", "3389"] #allowing ssh and rdp
  }

  allow {
    protocol = "icmp"  #allowing pings
  }

  source_ranges = ["0.0.0.0/0"] #allowing incoming traffic from the specified network address, in this case all addresses are allowed
