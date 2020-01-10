# include: "//@{CONFIG_PROJECT_NAME}/lead.view"
include: "//block-sales-config/lead.view"

view: lead {
  extends: [lead_config]
}

view: lead_core {
  extension: required #add this if you re-generate this file
  sql_table_name: @{SALESFORCE_SCHEMA}.lead ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: as_lead {
    type: duration
    sql_start: ${created_raw}  ;;
    sql_end: current_timestamp  ;;
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

  dimension: annual_revenue {
    type: number
    sql: ${TABLE}.annual_revenue ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
    group_label: "Address"
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
    group_label: "Address"
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
    group_label: "Address"
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
    group_label: "Address"
  }

  dimension: clean_status {
    type: string
    sql: ${TABLE}.clean_status ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: company_duns_number {
    type: string
    sql: ${TABLE}.company_duns_number ;;
    hidden: yes
  }

  dimension: converted_account_id {
    type: string
    sql: ${TABLE}.converted_account_id ;;
    hidden: yes
  }

  dimension: converted_contact_id {
    type: string
    sql: ${TABLE}.converted_contact_id ;;
    hidden: yes
  }

  dimension_group: converted {
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
    sql: ${TABLE}.converted_date ;;
  }

  dimension: converted_opportunity_id {
    type: string
    sql: ${TABLE}.converted_opportunity_id ;;
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

  dimension: current_generators_c {
    type: string
    sql: ${TABLE}.current_generators_c ;;
  }

  dimension: dandb_company_id {
    type: string
    sql: ${TABLE}.dandb_company_id ;;
    hidden: yes
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension_group: email_bounced {
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
    sql: ${TABLE}.email_bounced_date ;;
    hidden: yes
  }

  dimension: email_bounced_reason {
    type: string
    sql: ${TABLE}.email_bounced_reason ;;
    hidden: yes
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: geocode_accuracy {
    type: string
    sql: ${TABLE}.geocode_accuracy ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension: is_converted {
    type: yesno
    sql: ${TABLE}.is_converted ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_unread_by_owner {
    type: yesno
    sql: ${TABLE}.is_unread_by_owner ;;
    hidden: yes
  }

  dimension: jigsaw {
    type: string
    sql: ${TABLE}.jigsaw ;;
    hidden: yes
  }

  dimension: jigsaw_contact_id {
    type: string
    sql: ${TABLE}.jigsaw_contact_id ;;
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

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
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

  dimension: lead_source {
    type: string
    sql: ${TABLE}.lead_source ;;
  }


  dimension: master_record_id {
    type: string
    sql: ${TABLE}.master_record_id ;;
    hidden: yes
  }

  dimension: mobile_phone {
    type: string
    sql: ${TABLE}.mobile_phone ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    html: <a href="https://{{ salesforce_domain_config._sql }}/{{ lead.id._value }}" target="_new">
          <img src="https://www.google.com/s2/favicons?domain=www.salesforce.com" height=16 width=16></a>
          {{ linked_value }};;
  }

  dimension: number_of_employees {
    type: number
    sql: ${TABLE}.number_of_employees ;;
  }

  dimension: numberof_locations_c {
    type: number
    sql: ${TABLE}.numberof_locations_c ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
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

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension: primary_c {
    type: string
    sql: ${TABLE}.primary_c ;;
  }

  dimension: product_interest_c {
    type: string
    sql: ${TABLE}.product_interest_c ;;
  }

  dimension: rating {
    type: string
    sql: ${TABLE}.rating ;;
  }

  dimension: salutation {
    type: string
    sql: ${TABLE}.salutation ;;
  }

  dimension: siccode_c {
    type: string
    sql: ${TABLE}.sic_code_c ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
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

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }

  dimension: convert_to_contact {
    label: "Days to Contact Conversion"
    description: "Number of days it took to convert the lead into a contact"
    type: number
    sql: DATE_DIFF(${converted_date}, ${created_date}, DAY) ;;
  }

  # Typically, an opportunity is automatically created when a lead is converted to a contact.
  dimension: convert_to_opportunity {
    label: "Days to Opp. Conversion"
    description: "Number of days it took to convert the lead into an opportunity"
    type: number
    sql: DATE_DIFF(${opportunity.created_date}, ${created_date}, DAY) ;;
  }

  dimension: id_url {
    sql: ${TABLE}.id ;;
    html: [<a href="https://{{ salesforce_domain_config._sql }}/{{ value }}">Open in SFDC</a>]
      ;;
  }

  dimension: number_of_employees_tier {
    type: tier
    tiers: [
      0,
      1,
      11,
      51,
      201,
      501,
      1001,
      5001,
      10000
    ]
    sql: ${number_of_employees} ;;
    style: integer
    description: "Number of Employees as reported on the Salesforce lead"
  }

#   Measures:

  measure: count {
    type: count
    drill_fields: [id, name, first_name, last_name]
    label: "Number of Leads"
  }

  measure: avg_convert_to_contact {
    label: "Average Days to Contact Conversion"
    description: "Average number of days it took to convert the lead into a contact"
    type: average
    sql: ${convert_to_contact} ;;
    value_format_name: decimal_1
  }

  measure: avg_convert_to_opportunity {
    label: "Average Days to Opp. Conversion"
    description: "Average number of days it took to convert the lead into an opportunity"
    type: average
    sql: ${convert_to_opportunity} ;;
    value_format_name: decimal_1
  }

  measure: converted_to_contact_count {
    label: "Number of Leads Converted to Contacts"
    type: count
    drill_fields: [detail*]

    filters: {
      field: converted_contact_id
      value: "-null"
    }
  }

  measure: converted_to_account_count {
    label: "Number of Leads Converted to Accounts"
    type: count
    drill_fields: [detail*]

    filters: {
      field: converted_account_id
      value: "-null"
    }
  }

  measure: converted_to_opportunity_count {
    label: "Number of Leads Converted to Opportunities"
    type: count
    drill_fields: [detail*]

    filters: {
      field: converted_opportunity_id
      value: "-null"
    }
  }

  measure: conversion_to_contact_percent {
    label: "% Leads Converted to Contacts"
    sql: 100.00 * ${converted_to_contact_count} / NULLIF(${count},0) ;;
    type: number
    value_format: "0.00\%"
  }

  measure: conversion_to_account_percent {
    label: "% Leads Converted to Accounts"
    sql: 100.00 * ${converted_to_account_count} / NULLIF(${count},0) ;;
    type: number
    value_format: "0.00\%"
  }

  measure: conversion_to_opportunity_percent {
    label: "% Leads Converted to Opportunities"
    sql: 100.00 * ${converted_to_opportunity_count} / NULLIF(${count},0) ;;
    type: number
    value_format: "0.00\%"
  }

  measure: count_active_leads {
    label: "Number of Active Leads"
    type: count
    value_format_name: decimal_0
    drill_fields: [active_lead_detail*]
    filters: {
      field: is_converted
      value: "No"
    }
    filters: {
      field: is_deleted
      value: "No"
    }
  }
    set: detail {
      fields: [
        id,
        company,
        name,
        title,
        phone,
        email,
        status
      ]
    }

    set: active_lead_detail {
      fields: [
        created_date,
        name,
        phone,
        email,
        last_activity_date,
        task.calls,
        task.emails,
        task.meetings
      ]
    }
}
