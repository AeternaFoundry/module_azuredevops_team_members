resource "azuredevops_team_members" "team_members" {
  for_each = var.team_members

  members    = each.value.members
  project_id = each.value.project_id
  team_id    = each.value.team_id
  mode       = each.value.mode

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

