output "team_members_id" {
  description = "Map of id values across all team_members, keyed the same as var.team_members"
  value       = { for k, v in azuredevops_team_members.team_members : k => v.id }
}
output "team_members_members" {
  description = "Map of members values across all team_members, keyed the same as var.team_members"
  value       = { for k, v in azuredevops_team_members.team_members : k => v.members }
}
output "team_members_mode" {
  description = "Map of mode values across all team_members, keyed the same as var.team_members"
  value       = { for k, v in azuredevops_team_members.team_members : k => v.mode }
}
output "team_members_project_id" {
  description = "Map of project_id values across all team_members, keyed the same as var.team_members"
  value       = { for k, v in azuredevops_team_members.team_members : k => v.project_id }
}
output "team_members_team_id" {
  description = "Map of team_id values across all team_members, keyed the same as var.team_members"
  value       = { for k, v in azuredevops_team_members.team_members : k => v.team_id }
}

