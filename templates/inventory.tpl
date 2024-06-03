all:
  children:
    observer:
      hosts:
        observer:
          ansible_host: ${observer_ip}
          ansible_ssh_user: ${ansible_ssh_user}
          ansible_ssh_private_key_file: ${ansible_ssh_private_key_file}
    target:
      hosts:
        observer:
          ansible_host: ${observer_ip}
          ansible_ssh_user: ${ansible_ssh_user}
          ansible_ssh_private_key_file: ${ansible_ssh_private_key_file}
%{ for ip in target_ips ~}
        target-${ip.index}:
          ansible_host: ${ip.value}
          ansible_ssh_user: ${ansible_ssh_user}
          ansible_ssh_private_key_file: ${ansible_ssh_private_key_file}
%{ endfor ~}