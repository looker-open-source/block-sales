# include: "//@{CONFIG_PROJECT_NAME}/account.view"
include: "//block-sales-config/account.view"

view: account {
  extends: [account_config]
}

view: account_core {
  extension: required #add this if you re-generate this file
#   sql_table_name: @{SCHEMA_NAME}.account ;;
  sql_table_name: salesforce.account ;;

###   Dimensions:

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension_group: _fivetran_synced {
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
    sql: ${TABLE}._fivetran_synced ;;
    hidden: yes
  }

  dimension: account_number {
    type: string
    sql: ${TABLE}.account_number ;;
  }

  dimension: account_source {
    type: string
    sql: ${TABLE}.account_source ;;
  }

  dimension: annual_revenue {
    type: number
    sql: ${TABLE}.annual_revenue ;;
    hidden: yes
  }

  dimension: billing_city {
    type: string
    sql: ${TABLE}.billing_city ;;
    group_label: "Billing Details"
  }

  dimension: billing_country {
    type: string
    sql: ${TABLE}.billing_country ;;
    group_label: "Billing Details"
  }

  dimension: billing_geocode_accuracy {
    type: string
    sql: ${TABLE}.billing_geocode_accuracy ;;
    group_label: "Billing Details"
    hidden: yes
  }

  dimension: billing_latitude {
    type: number
    sql: ${TABLE}.billing_latitude ;;
    group_label: "Billing Details"
  }

  dimension: billing_longitude {
    type: number
    sql: ${TABLE}.billing_longitude ;;
    group_label: "Billing Details"
  }

  dimension: billing_postal_code {
    type: string
    sql: ${TABLE}.billing_postal_code ;;
    group_label: "Billing Details"
  }

  dimension: billing_state {
    type: string
    sql: ${TABLE}.billing_state ;;
    group_label: "Billing Details"
  }

  dimension: billing_street {
    type: string
    sql: ${TABLE}.billing_street ;;
    group_label: "Billing Details"
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

  dimension: domain {
    sql: REGEXP_REPLACE(REGEXP_REPLACE(${website},"^https?://",""),"(www2?.)","");;
  }

  dimension: distinct_id {
    type: string
    sql: distinct ${TABLE}.id ;;
  }

  dimension: logo64 {
    sql: ${domain} ;;
    html: <a href="https://na9.salesforce.com/{{ opportunity.id._value }}" target="_new">
      <img src="https://logo.clearbit.com/{{ value }}" height=64 width=64></a>
      ;;
  }

  dimension: id_url {
    sql: ${TABLE}.id ;;
    html: [<a href="https://{{ salesforce_domain_config._sql }}/{{ value }}">Open in SFDC</a>];;
    hidden: yes
  }

  dimension: logo {
    sql: ${domain} ;;
    html: <a href="https://{{ value }}" target="_new">
      <img src="https://logo.clearbit.com/{{ value }}" height=128 width=128></a>
      ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
    hidden: yes
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
    group_label: "Status"
  }

  dimension: jigsaw {
    type: string
    sql: ${TABLE}.jigsaw ;;
    hidden: yes
  }

  dimension: jigsaw_company_id {
    type: string
    sql: ${TABLE}.jigsaw_company_id ;;
    hidden: yes
  }

  dimension_group: last_activity {
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
    sql: ${TABLE}.last_activity_date ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.last_modified_by_id ;;
    hidden: yes
  }

  dimension_group: last_modified {
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
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension_group: last_referenced {
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
    sql: ${TABLE}.last_referenced_date ;;
    hidden: yes
  }

  dimension_group: last_viewed {
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
    sql: ${TABLE}.last_viewed_date ;;
    hidden: yes
  }

  dimension: master_record_id {
    type: string
    sql: ${TABLE}.master_record_id ;;
    hidden: yes
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    html: <a href="https://{{ salesforce_domain_config._sql }}/{{ account.id._value }}" target="_new">
          <img src="https://www.google.com/s2/favicons?domain=www.salesforce.com" height=16 width=16></a>
          {{ linked_value }};;
  }

  dimension: number_of_employees {
    type: number
    sql: ${TABLE}.number_of_employees ;;
  }


  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
    hidden: yes
  }

  dimension: ownership {
    type: string
    sql: ${TABLE}.ownership ;;
    hidden: yes
  }

  dimension: parent_id {
    type: string
    sql: ${TABLE}.parent_id ;;
    hidden: yes
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photo_url ;;
  }

  dimension: rating {
    type: string
    sql: ${TABLE}.rating ;;
    hidden: yes
  }

  dimension: shipping_city {
    type: string
    sql: ${TABLE}.shipping_city ;;
    group_label: "Shipping Details"
  }

  dimension: shipping_country {
    type: string
    sql: ${TABLE}.shipping_country ;;
    group_label: "Shipping Details"
  }

  dimension: shipping_geocode_accuracy {
    type: string
    sql: ${TABLE}.shipping_geocode_accuracy ;;
    group_label: "Shipping Details"
  }

  dimension: shipping_latitude {
    type: number
    sql: ${TABLE}.shipping_latitude ;;
    group_label: "Shipping Details"
  }

  dimension: shipping_longitude {
    type: number
    sql: ${TABLE}.shipping_longitude ;;
    group_label: "Shipping Details"
  }

  dimension: shipping_postal_code {
    type: string
    sql: ${TABLE}.shipping_postal_code ;;
    group_label: "Shipping Details"
  }

  dimension: shipping_state {
    type: string
    sql: ${TABLE}.shipping_state ;;
    group_label: "Shipping Details"
  }

  dimension: shipping_street {
    type: string
    sql: ${TABLE}.shipping_street ;;
    group_label: "Shipping Details"
  }

  dimension: sic {
    type: string
    sql: ${TABLE}.sic ;;
    hidden: yes
  }

  dimension: sic_desc {
    type: string
    sql: ${TABLE}.sic_desc ;;
    hidden: yes
  }

  dimension: site {
    type: string
    sql: ${TABLE}.site ;;
    hidden: yes
  }

  dimension_group: system_modstamp {
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
    hidden: yes
  }

  dimension: ticker_symbol {
    type: string
    sql: ${TABLE}.ticker_symbol ;;
    hidden: yes
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }

####   Measures

  measure: count {
    type: count
    drill_fields: [id, name, contact.count, opportunity.count, user.count]
  }

  measure: percent_of_accounts {
    description: "Percent of accounts out of the total number of accounts"
    type: percent_of_total
    sql: ${count} ;;
  }

  measure: average_annual_revenue {
    type: average
    sql: ${annual_revenue} ;;
    value_format_name: custom_amount_value_format
  }

  measure: total_number_of_employees {
    type: sum
    sql: ${number_of_employees} ;;
  }

  measure: average_number_of_employees {
    type: average
    sql: ${number_of_employees} ;;
    value_format_name: decimal_1
  }


}
