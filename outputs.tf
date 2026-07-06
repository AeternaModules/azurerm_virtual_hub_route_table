output "virtual_hub_route_tables" {
  description = "All virtual_hub_route_table resources"
  value       = azurerm_virtual_hub_route_table.virtual_hub_route_tables
}
output "virtual_hub_route_tables_labels" {
  description = "List of labels values across all virtual_hub_route_tables"
  value       = [for k, v in azurerm_virtual_hub_route_table.virtual_hub_route_tables : v.labels]
}
output "virtual_hub_route_tables_name" {
  description = "List of name values across all virtual_hub_route_tables"
  value       = [for k, v in azurerm_virtual_hub_route_table.virtual_hub_route_tables : v.name]
}
output "virtual_hub_route_tables_route" {
  description = "List of route values across all virtual_hub_route_tables"
  value       = [for k, v in azurerm_virtual_hub_route_table.virtual_hub_route_tables : v.route]
}
output "virtual_hub_route_tables_virtual_hub_id" {
  description = "List of virtual_hub_id values across all virtual_hub_route_tables"
  value       = [for k, v in azurerm_virtual_hub_route_table.virtual_hub_route_tables : v.virtual_hub_id]
}

