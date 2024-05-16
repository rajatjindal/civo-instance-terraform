resource "random_pet" "generated" {}
data "civo_ssh_key" "shared_ssh_key" {
  name = "rjindal"
}

# Create a new instance
resource "civo_instance" "instances" {
  count        = var.instance_count
  hostname     = "server-${random_pet.generated.id}-${count.index}"
  tags         = ["server", "cpu"]
  notes        = "host for running service"
  size         = var.instance_type
  disk_image   = var.disk_image_name
  sshkey_id    = data.civo_ssh_key.shared_ssh_key.id
  initial_user = "ubuntu"
  region       = var.region
}
