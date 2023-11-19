provider "google" {
  project = "playground-s-11-1cfe966f"
  region  = "europe-west1"
}

resource "google_compute_instance" "Compute_Instance_1" {
  name         = "Compute_Instance_1"
  machine_type = "e2-micro"
  zone         = "europe-west1-d"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
      size  = 20 # Boot disk size in GB
    }
  }

  network_interface {
    network = "mynetwork" 
    subnetwork = "subnet-1"
    
  }

resource "google_compute_firewall" "allow-ssh-rdp-icmp" {
  name    = "allow-ssh-rdp-icmp"
  network = "mynetwork" 

  allow {
    protocol = "tcp"
    ports    = ["22", "3389", "80"] #allowing ssh, rdp and http
  }

  allow {
    protocol = "icmp"  #allowing pings
  }

  source_ranges = ["0.0.0.0/0"] #allowing incoming traffic from the specified network address, in this case all addresses are allowed
