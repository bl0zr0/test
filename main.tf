data "google_compute_regions" "available" {
  project = "cloudaudit-315104"
}

resource "google_storage_bucket" "test" {
  name          = "test-tf-bucket"
  location      = "australia-southeast1"
  force_destroy = true
}

output "regions" {
  value = data.google_compute_regions.available
}
