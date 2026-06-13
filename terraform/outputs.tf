output "project_name" {
  value = var.project_name
}

output "bucket_name" {
  value = module.storage.bucket_name
}

output "cloudfront_domain" {
  value = module.storage.cloudfront_domain
}

output "log_group_name" {
  value = module.monitoring.log_group_name
}

output "alb_dns_name" {
  value = module.compute.alb_dns_name
}