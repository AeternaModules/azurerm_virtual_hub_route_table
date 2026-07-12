variable "virtual_hub_route_tables" {
  description = <<EOT
Map of virtual_hub_route_tables, attributes below
Required:
    - name
    - virtual_hub_id
Optional:
    - labels
    - route (block):
        - destinations (required)
        - destinations_type (required)
        - name (required)
        - next_hop (required)
        - next_hop_type (optional)
EOT

  type = map(object({
    name           = string
    virtual_hub_id = string
    labels         = optional(set(string))
    route = optional(list(object({
      destinations      = set(string)
      destinations_type = string
      name              = string
      next_hop          = string
      next_hop_type     = optional(string) # Default: "ResourceId"
    })))
  }))
  # --- Unconfirmed validation candidates, derived from azurerm_virtual_hub_route_table's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from networkValidate.HubRouteTableName] !matched
  # path: virtual_hub_id
  #   source:    [from virtualwans.ValidateVirtualHubID] !ok
  # path: virtual_hub_id
  #   source:    [from virtualwans.ValidateVirtualHubID] err != nil
  # path: route.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: route.destinations[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: route.destinations_type
  #   condition: contains(["CIDR", "ResourceId", "Service"], value)
  #   message:   must be one of: CIDR, ResourceId, Service
  # path: route.next_hop
  #   source:    [from azure.ValidateResourceID] !ok
  # path: route.next_hop
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: route.next_hop_type
  #   condition: contains(["ResourceId"], value)
  #   message:   must be one of: ResourceId
}

