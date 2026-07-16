output "virtual_hub_route_tables_id" {
  description = "Map of id values across all virtual_hub_route_tables, keyed the same as var.virtual_hub_route_tables"
  value       = { for k, v in azurerm_virtual_hub_route_table.virtual_hub_route_tables : k => v.id if v.id != null && length(v.id) > 0 }
}
output "virtual_hub_route_tables_labels" {
  description = "Map of labels values across all virtual_hub_route_tables, keyed the same as var.virtual_hub_route_tables"
  value       = { for k, v in azurerm_virtual_hub_route_table.virtual_hub_route_tables : k => v.labels if v.labels != null && length(v.labels) > 0 }
}
output "virtual_hub_route_tables_name" {
  description = "Map of name values across all virtual_hub_route_tables, keyed the same as var.virtual_hub_route_tables"
  value       = { for k, v in azurerm_virtual_hub_route_table.virtual_hub_route_tables : k => v.name if v.name != null && length(v.name) > 0 }
}
output "virtual_hub_route_tables_route" {
  description = "Map of route values across all virtual_hub_route_tables, keyed the same as var.virtual_hub_route_tables"
  value       = { for k, v in azurerm_virtual_hub_route_table.virtual_hub_route_tables : k => v.route if v.route != null && length(v.route) > 0 }
}
output "virtual_hub_route_tables_virtual_hub_id" {
  description = "Map of virtual_hub_id values across all virtual_hub_route_tables, keyed the same as var.virtual_hub_route_tables"
  value       = { for k, v in azurerm_virtual_hub_route_table.virtual_hub_route_tables : k => v.virtual_hub_id if v.virtual_hub_id != null && length(v.virtual_hub_id) > 0 }
}

