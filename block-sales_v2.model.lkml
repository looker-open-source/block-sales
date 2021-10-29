connection: "@{CONNECTION_NAME}"

include: "/explores/*.explore" ## Include All Explores
include: "/dashboards/*.dashboard" ## Include All Dashboards


## Attributes
named_value_format: custom_amount_value_format {
  value_format: "[>=1000000]$0.0,,\"M\";[>=1000]$0,\"K\";$0.00"
}
