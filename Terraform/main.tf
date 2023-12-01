resource "google_compute_instance" "instance-1" {
  name         = "instance-1"
  machine_type = "e2-micro"
  zone         = "europe-west1-d"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 20 # Boot disk size in GB
    }
  }

  network_interface {
    network = google_compute_network.mynetwork.name
    subnetwork = google_compute_subnetwork.subnet-1.name
    
  }
}

resource "google_compute_firewall" "allow-ssh-rdp-icmp" {
  name    = "allow-ssh-rdp-icmp"
  network = google_compute_network.mynetwork.name 

  allow {
    protocol = "tcp"
    ports    = ["22", "3389", "80"] #allowing ssh, rdp and http
  }

  allow {
    protocol = "icmp"  #allowing pings
  }

  source_ranges = ["0.0.0.0/0"] #allowing incoming traffic from the specified network address, in this case all addresses are allowed
}
