module "civo_lon1_instances" {
  source               = "../modules/civo-instance"
  instance_count       = 1
  region               = "LON1"
  instance_type        = "g4s.xsmall"
  disk_image_name      = "ubuntu-jammy"
  disk_image_version   = "22.04"
}

# Create a new instance in frankfurt region
module "civo_fra1_instances" {
  source               = "../modules/civo-instance"
  instance_count       = 1
  region               = "FRA1"
  instance_type        = "g4s.xsmall"
  disk_image_name      = "ubuntu-jammy"
  disk_image_version   = "22.04"
}