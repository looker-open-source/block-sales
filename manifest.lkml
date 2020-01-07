project_name: "block-salesforce"

################# Constants #################

# constant: CONNECTION_NAME {
#   value: "looker_application"
#   export: override_required
# }

# constant: SCHEMA_NAME {
#   value: "salesforce_for_looker"
#   export: override_optional
# }

# constant: CONFIG_PROJECT_NAME {
#   value: "block-sales-config"
#   export: override_required
# }

################ Dependencies ################

local_dependency: {
#   project: "@{CONFIG_PROJECT_NAME}"
project: "block-sales-config"
  # override_constant: SCHEMA_NAME {
  #   value: "@{SCHEMA_NAME}"
  # }

}
