variable "lab_prefix" {
  description = "Prefix to distinguish which ACL is being run. E.g.: detroit-november"
  default     = "kqg-minikube"
}

variable "gcloud_project" {
  description = "Name of GCloud project to spin up the bastion host"
  default     = "myProject"
}

variable "gcloud_zone" {
  description = "Zone of the GCloud project"
  default     = "us-central1-a"
}

variable "gcloud_cred_file" {
  description = "Path to GCloud credential file"
}

variable "instance_size" {
  description = "Size of the bastion host"
  default     = "n1-standard-16"
}

variable "ssh_pub_key" {
  description = "Path to public SSH key"
  default     = "./key.pub"
}

variable "ssh_priv_key" {
  description = "Path to private SSH key"
  default     = "./key"
}

variable "keptn_release" {
  description = "Release/version of keptn"
  default     = "0.6.0"
}

variable "minikube_release" {
  description = "Release/version of keptn"
  default     = "v1.2.0"
}

variable "os" {
  description = "OS for the image"
  default     = "ubuntu-1804-bionic-v20200129a"
}

variable "disk-size" {
  description = "Size of the disk"
  default     = "100"
}

variable "username" {
  description = "User that will be created on this host"
  default     = "keptn"
}