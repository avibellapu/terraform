provider "google" {
  credentials = "${file("account.json")}"
  project     = "my-terraform-project"
  region      = "us-central1"
}