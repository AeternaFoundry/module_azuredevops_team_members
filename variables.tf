variable "team_members" {
  description = <<EOT
Map of team_members, attributes below
Required:
    - members
    - project_id
    - team_id
Optional:
    - mode
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - read (optional)
        - update (optional)
EOT

  type = map(object({
    members    = set(string)
    project_id = string
    team_id    = string
    mode       = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.team_members : (
        can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.project_id))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.team_members : (
        can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.team_id))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.team_members : (
        v.mode == null || (contains([for v in ["add", "overwrite"] : lower(v)], lower(v.mode)))
      )
    ])
    error_message = "must be one of: \"add\", \"overwrite\""
  }
  validation {
    condition = alltrue([
      for k, v in var.team_members : (
        alltrue([for x in v.members : length(trimspace(x)) > 0])
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
}

