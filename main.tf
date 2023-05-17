resource "google_compute_network" "custom" {
  name                    = "my-network"
  auto_create_subnetworks = false
}
# [END vpc_compute_basic_vm_custom_vpc_network]

# [START vpc_compute_basic_vm_custom_vpc_subnet]
resource "google_compute_subnetwork" "custom" {
  name          = "my-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = "europe-west1"
  network       = google_compute_network.custom.id
}
# [END vpc_compute_basic_vm_custom_vpc_subnet]

# [START compute_instances_create_with_subnet]

# Create a VM in a custom VPC network and subnet

resource "google_compute_instance" "custom_subnet" {
  name         = "my-vm-instance"
  tags         = ["allow-ssh"]
  zone         = "europe-west1-b"
  machine_type = "e2-small"
  network_interface {
    network    = google_compute_network.custom.id
    subnetwork = google_compute_subnetwork.custom.id
  }
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
}