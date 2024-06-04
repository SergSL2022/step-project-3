resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/templates/inventory.tpl", {
    observer_ip = aws_instance.observer.public_ip
    target_ips = [
      for idx, ip in aws_instance.target[*].public_ip :
      { index = idx + 1, value = ip }
    ]
    ansible_ssh_user             = "ubuntu"
    ansible_ssh_private_key_file = "../${aws_key_pair.slipchuk_step3.key_name}"
  })

  filename = "${path.module}/ansible/inventories/hosts.yml"
}

resource "null_resource" "ansible" {

  provisioner "local-exec" {
    working_dir = "${path.module}/ansible"
    command     = <<EOT
      sleep 60
      ansible-playbook -i inventories/hosts.yml playbooks/monitoring.yml --vault-password-file vault_key.txt
    EOT
  }

  depends_on = [local_file.ansible_inventory]

}
