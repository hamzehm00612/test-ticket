
variable "bucket_acl" {
  default = "private"
}
resource "aws_s3_bucket" "bucket" {
  bucket = "bucket.mycorp.tld"
  acl = var.bucket_acl
}


resource "aws_security_group_rule" "my-rule" {
    type = "ingress"
    cidr_blocks = ["0.0.0.0/0"]
}


resource "aws_efs_file_system" "sharedstore" {
  creation_token = var.efs["creation_token"]

  lifecycle_policy {
    transition_to_ia = var.efs["transition_to_ia"]
  }

  kms_key_id                      = var.efs["kms_key_id"]
  encrypted                       = false
  performance_mode                = var.efs["performance_mode"]
  provisioned_throughput_in_mibps = var.efs["provisioned_throughput_in_mibps"]
  throughput_mode                 = var.efs["throughput_mode"]
}
