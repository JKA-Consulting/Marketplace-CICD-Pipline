resource "google_compute_network" "mynetwork" {
  name                    = "mynetwork"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet-1" {
  name          = "subnet-1"
  network       = google_compute_network.mynetwork.self_link
  ip_cidr_range = "10.0.1.0/24"  # Replace with your desired IP range
}