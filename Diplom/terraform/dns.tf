resource "yandex_dns_zone" "kashindiplomdns" {
  name        = "kashin-diplom-zone"
  description = "Diplom public zone"
  zone    = "kashin.store."
  public  = true
  depends_on = [
    yandex_vpc_subnet.subnetwork1,yandex_vpc_subnet.subnetwork2
  ]
}

resource "yandex_dns_recordset" "def" {
  zone_id = yandex_dns_zone.kashindiplomdns.id
  name    = "@.kashin.store."
  type    = "A"
  ttl     = 200
  data    = [yandex_vpc_address.kashinip.external_ipv4_address[0].address]
}

resource "yandex_dns_recordset" "gitlab" {
  zone_id = yandex_dns_zone.kashindiplomdns.id
  name    = "gitlab.kashin.store."
  type    = "A"
  ttl     = 200
  data    = [yandex_vpc_address.kashinip.external_ipv4_address[0].address]
}

resource "yandex_dns_recordset" "alertmanager" {
  zone_id = yandex_dns_zone.kashindiplomdns.id
  name    = "alertmanager.kashin.store."
  type    = "A"
  ttl     = 200
  data    = [yandex_vpc_address.kashinip.external_ipv4_address[0].address]
}

resource "yandex_dns_recordset" "grafana" {
  zone_id = yandex_dns_zone.kashindiplomdns.id
  name    = "grafana.kashin.store."
  type    = "A"
  ttl     = 200
  data    = [yandex_vpc_address.kashinip.external_ipv4_address[0].address]
}

resource "yandex_dns_recordset" "prometheus" {
  zone_id = yandex_dns_zone.kashindiplomdns.id
  name    = "prometheus.kashin.store."
  type    = "A"
  ttl     = 200
  data    = [yandex_vpc_address.kashinip.external_ipv4_address[0].address]
}

resource "yandex_dns_recordset" "www" {
  zone_id = yandex_dns_zone.kashindiplomdns.id
  name    = "www.kashin.store."
  type    = "A"
  ttl     = 200
  data    = [yandex_vpc_address.kashinip.external_ipv4_address[0].address]
}
