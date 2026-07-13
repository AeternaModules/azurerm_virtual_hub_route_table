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
      next_hop_type     = optional(string)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.virtual_hub_route_tables : (
        v.route == null || alltrue([for item in v.route : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_hub_route_tables : (
        v.route == null || alltrue([for item in v.route : (alltrue([for x in item.destinations : length(x) > 0]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_hub_route_tables : (
        v.route == null || alltrue([for item in v.route : (contains(["CIDR", "ResourceId", "Service"], item.destinations_type))])
      )
    ])
    error_message = "must be one of: CIDR, ResourceId, Service"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_hub_route_tables : (
        v.route == null || alltrue([for item in v.route : (item.next_hop_type == null || (contains(["ResourceId"], item.next_hop_type)))])
      )
    ])
    error_message = "must be one of: ResourceId"
  }
  # Note: 5 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

