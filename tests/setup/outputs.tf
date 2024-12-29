output "repository_name_suffix" {
  value = random_string.repository_name.result
}
output "repository_name" {
  value = github_repository.main.name
}
output "repository_full_name" {
  value = github_repository.main.full_name
}
output "repository_html_url" {
  value = github_repository.main.html_url
}
output "username" {
  value = data.github_user.current.login
}
