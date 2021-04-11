/*когда-нибудь здесь будет ресурс для удаленного хранения стейт файла*/
provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}
terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "ivkosarev"
    region     = var.zone
    key        = "stage/terraform.tfstate"
    access_key = "Q9PnBATtGfrhs6NURG69"
    secret_key = "U-B8o0TEibQcPp0x-SUUexWx0XOAs46mKgF-Y6n5"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
