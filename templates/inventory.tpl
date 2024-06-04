all:
  vars:
    ansible_ssh_user: ${ansible_ssh_user}
    ansible_ssh_private_key_file: ${ansible_ssh_private_key_file}
    observer_vm_ip: ${observer_ip}
    target_vm_ips: [
      ${observer_ip},
%{ for ip in target_ips }
      ${ip.value},
%{ endfor }
    ]

  children:
    observer:
      hosts:
        observer:
          ansible_host: ${observer_ip}
          
    target:
      hosts:
        observer:
          ansible_host: ${observer_ip}

%{ for ip in target_ips ~}
        target-${ip.index}:
          ansible_host: ${ip.value}

%{ endfor ~}