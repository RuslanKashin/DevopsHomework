resource "null_resource" "prepare" {

  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i ../ansible/inventory.ini ../ansible/prepare.yml"
  }

  depends_on = [
    local_file.inventory
  ]
}


resource "null_resource" "generalplay" {

  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i ../ansible/inventory.ini ../ansible/generalplay.yml"
    on_failure = continue
  }

  depends_on = [
    null_resource.prepare
  ]
}
