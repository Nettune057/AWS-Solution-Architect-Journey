variable "name" {}
variable "image_tag_mutability" {}
variable "force_delete" {
    type = bool
}
variable "scan_on_push" {
    type = bool
}