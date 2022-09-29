resource "local_file" "inventory" {
  content = <<-EOT
    # Node List

    [node01nginx]
    nginx ansible_host=${yandex_compute_instance.node01nginx.network_interface.0.nat_ip_address}

    [node02db01]
    db01 ansible_host=${yandex_compute_instance.node02db01.network_interface.0.ip_address}

    [node03db02]
    db02 ansible_host=${yandex_compute_instance.node03db02.network_interface.0.ip_address}

    [node04app]
    app ansible_host=${yandex_compute_instance.node04app.network_interface.0.ip_address}

    [node05gitlab]
    gitlab ansible_host=${yandex_compute_instance.node05gitlab.network_interface.0.ip_address}

    [node06runner]
    runner ansible_host=${yandex_compute_instance.node06runner.network_interface.0.ip_address}

    [node07monitoring]
    monitoring ansible_host=${yandex_compute_instance.node07monitoring.network_interface.0.ip_address}

    [myallhosts:children]
    node01nginx
    node02db01
    node03db02
    node04app
    node05gitlab
    node06runner
    node07monitoring

    [noproxyhosts:children]
    node02db01
    node03db02
    node04app
    node05gitlab
    node06runner
    node07monitoring
    
    #
    # Vars for group and hosts
    #

    [node01nginx:vars]
    le_staging = "${local.le_staging[terraform.workspace]}"

    [node02db01:vars]
    mysql_replication_role = "master"

    [node03db02:vars]
    mysql_replication_role = "slave"


    [myallhosts:vars]
    my_domain = "${var.my_domain}"
    ip_node01nginx = ${yandex_compute_instance.node01nginx.network_interface.0.ip_address}
    ip_node02db01 = ${yandex_compute_instance.node02db01.network_interface.0.ip_address}
    ip_node03db02 = ${yandex_compute_instance.node03db02.network_interface.0.ip_address}
    ip_node04app = ${yandex_compute_instance.node04app.network_interface.0.ip_address}
    ip_node05gitlab = ${yandex_compute_instance.node05gitlab.network_interface.0.ip_address}
    ip_node06runner = ${yandex_compute_instance.node06runner.network_interface.0.ip_address}
    ip_node07monitoring = ${yandex_compute_instance.node07monitoring.network_interface.0.ip_address}
    
    [noproxyhosts:vars]
    ansible_ssh_common_args='-o ControlMaster=auto -o ControlPersist=10m -o ProxyCommand="ssh -W %h:%p -q ruslan@${yandex_compute_instance.node01nginx.network_interface.0.nat_ip_address}"'

    EOT
  filename = "../ansible/inventory.ini"
  file_permission = "0644"

  depends_on = [
    yandex_compute_instance.node01nginx,
    yandex_compute_instance.node02db01,
    yandex_compute_instance.node03db02,
    yandex_compute_instance.node04app,
    yandex_compute_instance.node05gitlab,
    yandex_compute_instance.node06runner,
    yandex_compute_instance.node07monitoring
  ]
}
