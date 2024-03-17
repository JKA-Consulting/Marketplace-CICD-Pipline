resource "google_compute_instance" "jenkins-instance" {
  name         = "jenkins-instance"
  machine_type = "e2-medium"
  zone         = var.subnet-zone

  boot_disk {
    initialize_params {
      image = "Ubuntu 20.04 LTS"
      size  = 20 # Boot disk size in GB
    }
  }

  network_interface {
    network    = google_compute_network.marketplace-vpc.name
    subnetwork = google_compute_subnetwork.marketplace-subnet1.name

  }

  metadata_startup_script = "${file("/jenkinsScript.sh")}"
}

resource "google_compute_firewall" "allow-ssh-rdp-icmp" {
  name    = "allow-ssh-rdp-icmp"
  network = google_compute_network.marketplace-vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22", "3389", "80", "8080"] #allowing ssh, rdp and http
  }

  allow {
    protocol = "icmp" #allowing pings
  }

  source_ranges = ["0.0.0.0/0"] #allowing incoming traffic from the specified network address, in this case all addresses are allowed
}
