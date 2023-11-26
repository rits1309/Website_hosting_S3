output "website-url" {
    value = "http://${var.mybucket}.s3-website.${var.region}.amazonaws.com"
}  
