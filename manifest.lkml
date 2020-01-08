project_name: "block-sales"

local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"
  override_constant: SALESFORCE_SCHEMA {
    value: "@{SALESFORCE_SCHEMA}"
  }
}

constant: CONFIG_PROJECT_NAME {
  value: "block-sales-config"
  export: override_required
}

constant: CONNECTION_NAME {
  value: "looker_application"
  export: override_required
}

constant: SALESFORCE_SCHEMA {
  value: "salesforce"
  export: override_required
}
