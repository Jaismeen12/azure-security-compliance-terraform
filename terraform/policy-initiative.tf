resource "azurerm_policy_set_definition" "Security_Compliance_Initiative" {
  name         = "Security-Compliance-Initiative"
  policy_type  = "Custom"
  display_name = "Security and Compliance Initiative"

  policy_definition_reference {
    policy_definition_id = azurerm_policy_definition.allowed_location.id
  }

  policy_definition_reference {
    policy_definition_id = azurerm_policy_definition.required_tags.id
  }
}