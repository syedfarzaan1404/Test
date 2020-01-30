### Non-sensitive Build variables ###
### Set backend used to store the tfstate file. azurerm stores it in an Azure storage account. 
terraform {
  backend "azurerm" {
  }
}
### SAS Token for Rackpsace scripts repo
variable "sas_token" {
  description = "SAS Token"
  default     = "TakenFromPipeline"
}
### Core device of destination subscription 
variable "core_device" {
  description = "CORE device ID"
  default     = "1039972"
}

variable "location" {
  description = "Target region for deployment"
  default = "North Europe"
}

### Resource Tags ###
locals {
  common_tags = {
    displayName                    = "Not Provided"
    appOwner                       = "Not Provided"
    requestNumber                  = "Not Provided"
    bauCostCentre                  = "Not Provided"
    bauCostCentreOwner             = "Not Provided"
    bauSupportLevel                = "Not Provided"
    bauStartDate                   = "Not Provided"
    "projectCostCentre ; ioNumber" = "Not Provided"
    projectCostCentreOwner         = "Not Provided"
    creationDate                   = "13/11/2019"
    handoverTicket                 = "191112-01190"
    Environment                    = "Prod"
    buildEngineer                  = "Farzaan Hasan"
    "RaxAutomation|Exclude"        = "Not Provided"
  }
}
### Resource Groups ###
variable "shr_rsg_name" {
  description = "Existing Shared Resource Group for OMS, RSV"
  default     = "diageo-information-security-rg-shared"
}

variable "net_rsg_name" {
  description = "Existing Resource Group for VNET, NSG"
  default     = "diageo-information-security-rg-network"
}

variable "udr_rsg_name" {
  description = "Existing Resource Group for Route Table"
  default     = "diageo-information-security-rg-udr"
}

variable "app_rsg_name" {
  description = "New Resource Group for the Application"
  default     = "diageo-backoffice-prod-rg-lic"
}

###
### Existing Shared Resources ###
variable "vnet_name" {
  description = "Existing Virtual Network name"
  default     = "diageo-eun-information-security-vnet-01"
}

variable "route_table_name" {
  description = "Existing Route table name - must be assigned to subnets"
  default     = "diageo-information-security-udr-forced-tunneling-to-firewall"
}

#variable "vm_oms" {
#  description = "Existing OMS Workspace name"
#  default     = "diageo-eun-backoffice-prod-oms-1012610"
#}

variable "vm_rsv" {
  description = "Existing Recovery Service Vault name"
  default     = "diageo-eun-information-security-rsv-01"
}

variable "vm_bupol" {
  description = "Existing Backup Policy name"
  default     = "Cat3-Production-Business-And-Application-Data-7D4W"
}

variable "vm_diagsa" {
  description = "Existing Diagnostic Storage Account name"
  default     = "stadiageoinfosecpdiag01"
}

### Subnets ###
variable "app_subnet_name" {
  description = "Name of new Application Subnet"  
  default     = "diageo-eun-information-security-vnet-01-lic-app-01-10.102.200.240_28"
}

variable "app_subnet_range" {
  description = "Address Range of new Application Subnet"
  default     = "10.102.200.240/28"
  
}

variable "app2_subnet_name" {
  description = "Name of new Application Subnet"
  default     = "diageo-eun-information-security-vnet-01-lic-db-01-10.102.200.224_28"  
}

variable "app2_subnet_range" {
  description = "Address Range of new Application Subnet"
  default     = "10.102.200.224/28"  
}

### Domain Join ###
variable "vm_domain_name" {
  description = "Name of the AD Domain to join"
  default     = "guww.net"
}

variable "vm_domain_ou" {
  description = "OU Path"
  default     = "OU=Application,OU=X86 Production,OU=X86,OU=Europe North,OU=Microsoft Azure,OU=Cloud,OU=Servers,DC=guww,DC=net"
}

variable "vm2_domain_ou" {
  description = "OU Path"
  default     = "OU=Database,OU=X86 Production,OU=X86,OU=Europe North,OU=Microsoft Azure,OU=Cloud,OU=Servers,DC=guww,DC=net"
}

variable "vm_ad_username" {
  description = "AD Account to join VM"
  default     = "TakenFromPipeline"
}

variable "vm_ad_password" {
  description = "AD Account password"
  default     = "TakenFromPipeline"
}

###
### VM Details ###
variable "vm_timezone" {
  description = "Timezone to set on Windows VMs"
  default     = "GMT Standard Time"
}

variable "admin_password" {
  description = "Local Admin password to set on all VMs"
  default     = "TakenFromPipeline"
}

###

#Output variables used by Pipeline

output "vm_names" {
  value = "${module.vm_app.vm_names}"
}

output "vm2_names" {
  value = "${module.vm_app2.vm_names}"
}
output "rsg_name" {
  value = "${azurerm_resource_group.app.name}"
}


