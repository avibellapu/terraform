provider "google" {
  credentials = file("account.json")
  project = "probable-splice-264802"
  region  = "us-central1"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    access_config {
    }
  }

#  provisioner "remote-exec" {
#    # Installing Git CLI on the GCE
#    inline = [
#      "sudo apt update"
#      "sudo apt install git"
#    ]
#  }
#
#  provisioner "remote-exec" {
#    # Clone FlaskApp from Git
#    command = "git clone https://github.com/avibellapu/web-python.git"
#  }

  provisioner "remote-exec" {
    command = "mkdir /home/test/python"
  }

  provisioner "file" {
    source = "web.py"
    destination = "/home/test/python"
  }
}