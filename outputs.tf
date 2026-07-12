output "virtual_hub_route_tables_id" {
  description = "Map of id values across all virtual_hub_route_tables, keyed the same as var.virtual_hub_route_tables"
  value       = { for k, v in azurerm_virtual_hub_route_table.virtual_hub_route_tables : k => v.id }
}
output "virtual_hub_route_tables_labels" {
  description = "Map of labels values across all virtual_hub_route_tables, keyed the same as var.virtual_hub_route_tables"
  value       = { for k, v in azurerm_virtual_hub_route_table.virtual_hub_route_tables : k => v.labels }
}
output "virtual_hub_route_tables_name" {
  description = "Map of name values across all virtual_hub_route_tables, keyed the same as var.virtual_hub_route_tables"
  value       = { for k, v in azurerm_virtual_hub_route_table.virtual_hub_route_tables : k => v.name }
}
output "virtual_hub_route_tables_route" {
  description = "Map of route values across all virtual_hub_route_tables, keyed the same as var.virtual_hub_route_tables"
  value       = { for k, v in azurerm_virtual_hub_route_table.virtual_hub_route_tables : k => v.route }
}
output "virtual_hub_route_tables_virtual_hub_id" {
  description = "Map of virtual_hub_id values across all virtual_hub_route_tables, keyed the same as var.virtual_hub_route_tables"
  value       = { for k, v in azurerm_virtual_hub_route_table.virtual_hub_route_tables : k => v.virtual_hub_id }
}

