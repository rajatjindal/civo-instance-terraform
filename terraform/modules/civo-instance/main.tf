resource "random_pet" "generated" {}

# Query small instance size
data "civo_size" "small" {
  filter {
    key      = "name"
    values   = [var.instance_type]
    match_by = "re"
  }

  filter {
    key    = "type"
    values = ["instance"]
  }
}

# Query instance disk image
data "civo_disk_image" "ubuntu" {
  filter {
    key    = "name"
    values = [var.disk_image_name]
  }

  filter {
    key    = "version"
    values = [var.disk_image_version]
  }

  region = var.region
}

data "civo_ssh_key" "shared_ssh_key" {
  name = "rjindal"
}

# Create a new instance
resource "civo_instance" "instances" {
  count        = var.instance_count
  hostname     = "server-${random_pet.generated.id}-${count.index}"
  tags         = ["server", "cpu"]
  notes        = "host for running service"
  size         = element(data.civo_size.small.sizes, 0).name
  disk_image   = element(data.civo_disk_image.ubuntu.diskimages, 0).id
  sshkey_id    = data.civo_ssh_key.shared_ssh_key.id
  initial_user = "ubuntu"
  region       = var.region
}
