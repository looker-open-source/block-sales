view: marketplace_sales_campaign {
  sql_table_name: @{SALESFORCE_SCHEMA}.campaign ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension_group: _fivetran_synced {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: actual_cost {
    type: number
    sql: ${TABLE}.actual_cost ;;
    hidden: yes
  }

  dimension: amount_all_opportunities {
    type: number
    sql: ${TABLE}.amount_all_opportunities ;;
    hidden: yes
  }

  dimension: amount_won_opportunities {
    type: number
    sql: ${TABLE}.amount_won_opportunities ;;
    hidden: yes
  }

  dimension: budgeted_cost {
    type: number
    sql: ${TABLE}.budgeted_cost ;;
    hidden: yes
  }

  dimension: campaign_member_record_type_id {
    type: string
    sql: ${TABLE}.campaign_member_record_type_id ;;
    hidden: yes
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
    hidden: yes
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_date ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.end_date ;;
  }

  dimension: expected_response {
    type: number
    sql: ${TABLE}.expected_response ;;
    hidden: yes
  }

  dimension: expected_revenue {
    type: number
    sql: ${TABLE}.expected_revenue ;;
    hidden: yes
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension_group: last_activity {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_activity_date ;;
  }

  dimension_group: last_modified {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension_group: last_referenced {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_referenced_date ;;
  }

  dimension_group: last_viewed {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_viewed_date ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    html: <a href="https://{{ salesforce_domain_config._sql }}/{{ campaign.id._value }}" target="_new">
          <img src="https://www.google.com/s2/favicons?domain=www.salesforce.com" height=16 width=16></a>
          {{ linked_value }};;
  }

  dimension: number_of_contacts {
    type: number
    sql: ${TABLE}.number_of_contacts ;;
    hidden: yes
  }

  dimension: number_of_converted_leads {
    type: number
    sql: ${TABLE}.number_of_converted_leads ;;
    hidden: yes
  }

  dimension: number_of_leads {
    type: number
    sql: ${TABLE}.number_of_leads ;;
    hidden:  yes
  }

  dimension: number_of_opportunities {
    type: number
    sql: ${TABLE}.number_of_opportunities ;;
    hidden: yes
  }

  dimension: number_of_responses {
    type: number
    sql: ${TABLE}.number_of_responses ;;
    hidden: yes
  }

  dimension: number_of_won_opportunities {
    type: number
    sql: ${TABLE}.number_of_won_opportunities ;;
    hidden: yes
  }

  dimension: number_sent {
    type: number
    sql: ${TABLE}.number_sent ;;
    hidden: yes
  }

  dimension: parent_id {
    type: string
    hidden: yes
    sql: ${TABLE}.parent_id ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.start_date ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: system_modstamp {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.system_modstamp ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, opportunity.count]
    label: "Number of Campaigns"
  }

  measure: total_number_of_won_opportunities {
    type: sum
    sql: ${number_of_won_opportunities} ;;
  }

  measure: total_number_sent {
    type: sum
    sql: ${number_sent} ;;
  }

  measure: total_number_of_responses {
    type: sum
    sql: ${number_of_responses} ;;
  }

  measure: total_number_of_leads {
    type: sum
    sql: ${number_of_leads} ;;
  }

  measure: total_number_of_converted_leads {
    type: sum
    sql: ${number_of_converted_leads} ;;
  }

  measure: total_number_of_contacts {
    type: sum
    sql: ${number_of_contacts} ;;
  }

  measure: total_cost {
    type: sum
    sql: ${actual_cost} ;;
    value_format_name: usd
  }

  dimension: owner_id {
    type: string
    hidden: yes
    sql: ${TABLE}.owner_id ;;
  }

  dimension: last_modified_by_id {
    type: string
    hidden: yes
    sql: ${TABLE}.last_modified_by_id ;;
  }
}
