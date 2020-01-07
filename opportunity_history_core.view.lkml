# # include: "//@{CONFIG_PROJECT_NAME}/opportunity_history.view"
# include: "//block-sales-config/opportunity.view"

# view: opportunity_history {
#   extends: [opportunity_history_config]
# }

# view: opportunity_history_core {
#   extension: required #add this if you re-generate this file
# #   sql_table_name: @{SCHEMA_NAME}.opportunity_history ;;
#   sql_table_name: salesforce.user ;;

#   dimension: id {
#     primary_key: yes
#     type: string
#     sql: ${TABLE}.id ;;
#   }

#   dimension_group: _fivetran_synced {
#     hidden: yes
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}._fivetran_synced ;;
#   }

#   dimension: amount {
#     hidden: yes
#     type: number
#     sql: ${TABLE}.amount ;;
#   }

#   dimension_group: close {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.close_date ;;
#   }

#   dimension: created_by_id {
#     type: string
#     sql: ${TABLE}.created_by_id ;;
#   }

#   dimension_group: created {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.created_date ;;
#     label: "Snapshot"
#   }

#   dimension: expected_revenue {
#     type: number
#     sql: ${TABLE}.expected_revenue ;;
#   }

#   dimension: forecast_category {
#     type: string
#     sql: ${TABLE}.forecast_category ;;
#   }

#   dimension: is_deleted {
#     type: yesno
#     sql: ${TABLE}.is_deleted ;;
#   }

#   dimension: opportunity_id {
#     type: string
#     sql: ${TABLE}.opportunity_id ;;
#   }

#   dimension: probability {
#     type: number
#     sql: ${TABLE}.probability ;;
#   }

#   dimension: stage_name {
#     type: string
#     sql: ${TABLE}.stage_name ;;
#   }

#   dimension_group: system_modstamp {
#     hidden: yes
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.system_modstamp ;;
#   }

# #   Measures:

#   measure: total_amount {
#     type: sum
#     sql: ${amount} ;;
#   }

# }
