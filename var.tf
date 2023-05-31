##variables for terraform##

variable "region" {
    type = string
    default = "east-us1"
    description = "East region"
}
variable "gcp_credentials" {
  type = string
  sensitive = true
  description = "Google Cloud service account credentials"
}