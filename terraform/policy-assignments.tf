# 1. Policy Definition
resource "azurerm_policy_definition" "allowed_location" {
  name         = "allowed-location"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Allow only Canada Central Location"
  description  = "This policy restricts the allowed locations for resources."

  policy_rule = file("${path.module}/../policies/allowed_location.json")
}

# 2. Combined Policy Assignment
resource "azurerm_subscription_policy_assignment" "allowed_location_assignment" {
  name                 = var.policy_assignment_name
  subscription_id      = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"
  policy_definition_id = azurerm_policy_definition.allowed_location.id

  # Extends the connection life so your local machine doesn't drop the API call early
  timeouts {
    create = "20m"
    read   = "10m"
  }
}
# 3. Required Tags Policy Definition
resource "azurerm_policy_definition" "required_tags" {
  name         = "required_tags"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "Require Owner Tag"
  description  = "This policy requires that the 'Owner' tag is applied to all resources."

  policy_rule = file("${path.module}/../policies/required_tags.json")
}

# 4. Required Tags Policy Assignment
resource "azurerm_subscription_policy_assignment" "required_tags_assignment" {
  name                 = "required-owner-tag-assignment"
  display_name         = "Require Owner Tag Assignment"
  subscription_id      = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"
  policy_definition_id = azurerm_policy_definition.required_tags.id
}

# 5. Secure Storage Policy Definition
resource "azurerm_policy_definition" "secure_storage" {
  name         = "secure_storage"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "Deny Storage Public Access"
  description  = "This policy denies storage accounts with public blob access enabled."

  policy_rule = file("${path.module}/../policies/secure_storage.json")
}

# 6. Secure Storage Policy Assignment
resource "azurerm_subscription_policy_assignment" "secure_storage_assignment" {
  name                 = "secure-storage-assignment"
  display_name         = "Secure Storage Assignment"
  subscription_id      = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"
  policy_definition_id = azurerm_policy_definition.secure_storage.id
}
