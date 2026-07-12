resource "azurerm_virtual_hub_route_table" "virtual_hub_route_tables" {
  for_each = var.virtual_hub_route_tables

  name           = each.value.name
  virtual_hub_id = each.value.virtual_hub_id
  labels         = each.value.labels

  dynamic "route" {
    for_each = each.value.route != null ? each.value.route : []
    content {
      destinations      = route.value.destinations
      destinations_type = route.value.destinations_type
      name              = route.value.name
      next_hop          = route.value.next_hop
      next_hop_type     = route.value.next_hop_type
    }
  }
}

