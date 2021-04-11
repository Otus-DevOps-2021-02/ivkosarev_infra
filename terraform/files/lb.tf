resource "yandex_lb_target_group" "target" {
  name = "my-target-group"
  #  region_id = var.zone
  count = var.instances_count
  target {
    subnet_id = var.subnet_id
    address   = "${yandex_compute_instance.app[count.index].network_interface.0.ip_address}"
  }

}

resource "yandex_lb_network_load_balancer" "balancer" {
  name      = "my-network-load-balancer"
  folder_id = var.folder_id
  count     = var.instances_count
  listener {
    name = "my-listener"
    port = 9292
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = "${yandex_lb_target_group.target[count.index].id}"

    healthcheck {
      name = "http"
      http_options {
        port = 9292
        path = "/"
      }
    }
  }

}