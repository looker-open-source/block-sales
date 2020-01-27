include: "//@{CONFIG_PROJECT_NAME}/fivetran_audit.view"

view: fivetran_audit {
  extends: [fivetran_audit_config]
}


view: fivetran_audit_core {
#   sql_table_name: @{SCHEMA_NAME}.fivetran_audit ;;
}
