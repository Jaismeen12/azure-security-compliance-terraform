data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "compliance_rg" {
  name     = "rf-security-compliance-lab"
  location = var.location

  tags = {
    Owner       = "jaismeen"
    Environment = "Lab"
    Project     = "Security-Compliance"
  }
}
