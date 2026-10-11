output "team_members_id" {
  description = "Map of id values across all team_members, keyed the same as var.team_members except keys with no id are omitted"
  value       = { for k, v in azuredevops_team_members.team_members : k => v.id if v.id != null && length(v.id) > 0 }
}
output "team_members_members" {
  description = "Map of members values across all team_members, keyed the same as var.team_members except keys with no members are omitted"
  value       = { for k, v in azuredevops_team_members.team_members : k => v.members if v.members != null && length(v.members) > 0 }
}
output "team_members_mode" {
  description = "Map of mode values across all team_members, keyed the same as var.team_members except keys with no mode are omitted"
  value       = { for k, v in azuredevops_team_members.team_members : k => v.mode if v.mode != null && length(v.mode) > 0 }
}
output "team_members_project_id" {
  description = "Map of project_id values across all team_members, keyed the same as var.team_members except keys with no project_id are omitted"
  value       = { for k, v in azuredevops_team_members.team_members : k => v.project_id if v.project_id != null && length(v.project_id) > 0 }
}
output "team_members_team_id" {
  description = "Map of team_id values across all team_members, keyed the same as var.team_members except keys with no team_id are omitted"
  value       = { for k, v in azuredevops_team_members.team_members : k => v.team_id if v.team_id != null && length(v.team_id) > 0 }
}

