# include: "//@{CONFIG_PROJECT_NAME}/contact.view"
include: "//block-sales-config/contact.view"

view: contact {
  extends: [contact_config]
}

view: contact_core {
  extension: required #add this if you re-generate this file
  sql_table_name: @{SALESFORCE_SCHEMA}.contact ;;

  dimension: account_id {
    type: string
    hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: assistant_name {
    type: string
    sql: ${TABLE}.assistant_name ;;
  }

  dimension: assistant_phone {
    type: string
    sql: ${TABLE}.assistant_phone ;;
  }

  dimension_group: birthdate {
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
    sql: ${TABLE}.birthdate ;;
  }

  dimension: clean_status {
    type: string
    sql: ${TABLE}.clean_status ;;
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

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
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
    sql: ${TABLE}.email_bounced_date ;;
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

  dimension: home_phone {
    type: string
    sql: ${TABLE}.home_phone ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_email_bounced {
    type: yesno
    sql: ${TABLE}.is_email_bounced ;;
    hidden:  yes
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

  dimension_group: last_curequest {
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
    sql: ${TABLE}.last_curequest_date ;;
  }

  dimension_group: last_cuupdate {
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
    sql: ${TABLE}.last_cuupdate_date ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.last_modified_by_id ;;
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

  dimension: lead_source {
    type: string
    sql: ${TABLE}.lead_source ;;
  }

  dimension: mailing_city {
    type: string
    sql: ${TABLE}.mailing_city ;;
    group_label: "Mailing Details"
  }

  dimension: mailing_country {
    type: string
    sql: ${TABLE}.mailing_country ;;
    group_label: "Mailing Details"
  }

  dimension: mailing_geocode_accuracy {
    type: string
    sql: ${TABLE}.mailing_geocode_accuracy ;;
    group_label: "Mailing Details"
  }

  dimension: mailing_latitude {
    type: number
    sql: ${TABLE}.mailing_latitude ;;
    group_label: "Mailing Details"
  }

  dimension: mailing_longitude {
    type: number
    sql: ${TABLE}.mailing_longitude ;;
    group_label: "Mailing Details"
  }

  dimension: mailing_postal_code {
    type: string
    sql: ${TABLE}.mailing_postal_code ;;
    group_label: "Mailing Details"
  }

  dimension: mailing_state {
    type: string
    sql: ${TABLE}.mailing_state ;;
    group_label: "Mailing Details"
  }

  dimension: mailing_street {
    type: string
    sql: ${TABLE}.mailing_street ;;
    group_label: "Mailing Details"
  }

  dimension: master_record_id {
    type: string
    sql: ${TABLE}.master_record_id ;;
    hidden:  yes
  }

  dimension: mobile_phone {
    type: string
    sql: ${TABLE}.mobile_phone ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    html: <a href="mailto:{{ contact.email._value }}" target="_blank">
    <img src="https://upload.wikimedia.org/wikipedia/commons/4/4e/Gmail_Icon.png" width="16" height="16" />
    </a>
    {{ linked_value }}
    ;;
  }

  dimension: other_city {
    type: string
    sql: ${TABLE}.other_city ;;
  }

  dimension: id_url {
    sql: ${TABLE}.id ;;
    html: [<a href="https://{{ salesforce_domain_config._sql }}/{{ value }}">Open in SFDC</a>]
      ;;
  }

  dimension: other_country {
    type: string
    sql: ${TABLE}.other_country ;;
  }

  dimension: other_geocode_accuracy {
    type: string
    sql: ${TABLE}.other_geocode_accuracy ;;
  }

  dimension: other_latitude {
    type: number
    sql: ${TABLE}.other_latitude ;;
  }

  dimension: other_longitude {
    type: number
    sql: ${TABLE}.other_longitude ;;
  }

  dimension: other_phone {
    type: string
    sql: ${TABLE}.other_phone ;;
  }

  dimension: other_postal_code {
    type: string
    sql: ${TABLE}.other_postal_code ;;
  }

  dimension: other_state {
    type: string
    sql: ${TABLE}.other_state ;;
  }

  dimension: other_street {
    type: string
    sql: ${TABLE}.other_street ;;
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

  dimension: reports_to_id {
    type: string
    sql: ${TABLE}.reports_to_id ;;
    hidden: yes
  }

  dimension: salutation {
    type: string
    sql: ${TABLE}.salutation ;;
  }

  dimension_group: system_modstamp {
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
    sql: ${TABLE}.system_modstamp ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  measure: count {
    type: count
    label: "Number of Contacts"
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      jigsaw_contact_id,
      name,
      assistant_name,
      first_name,
      last_name,
      account.id,
      account.name,
      user.count
    ]
  }
}
