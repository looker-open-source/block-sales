# include: "//@{CONFIG_PROJECT_NAME}/user.view"
include: "//block-sales-config/user.view"


view: user {
  extends: [user_config]
}

view: user_core {
  extension: required
  sql_table_name: @{SALESFORCE_SCHEMA}.user ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension_group: age  {
    type: duration
    datatype: date
    sql_start: ${created_date}  ;;
    sql_end: current_date ;;
  }

  dimension: tenure_months {
    label: "Tenure Months"
    type: string
    sql: concat(cast(${months_age} as string)," Months") ;;
  }

  dimension: tenure {
    sql: ${tenure_months} ;;
  }

  #### How longh does it take an AE to ramp #### default

  dimension: about_me {
    type: string
    sql: ${TABLE}.about_me ;;
    hidden: yes
  }

  dimension: account_id {
    type: string
    hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: alias {
    type: string
    sql: ${TABLE}.alias ;;
    hidden: yes
  }

  dimension: badge_text {
    type: string
    sql: ${TABLE}.badge_text ;;
    hidden: yes
  }

  dimension: banner_photo_url {
    type: string
    sql: ${TABLE}.banner_photo_url ;;
    hidden: yes
  }

  dimension: call_center_id {
    type: string
    sql: ${TABLE}.call_center_id ;;
    hidden: yes
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
    hidden: yes
  }

  dimension: community_nickname {
    type: string
    sql: ${TABLE}.community_nickname ;;
    hidden: yes
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: contact_id {
    type: string
    hidden: yes
    sql: ${TABLE}.contact_id ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
    hidden: yes
  }

  dimension: created_by_id {
    hidden: yes
    type: string
    sql: ${TABLE}.created_by_id ;;
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

  dimension: default_group_notification_frequency {
    type: string
    sql: ${TABLE}.default_group_notification_frequency ;;
    hidden: yes
  }

  dimension: delegated_approver_id {
    hidden: yes
    type: string
    sql: ${TABLE}.delegated_approver_id ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: digest_frequency {
    type: string
    sql: ${TABLE}.digest_frequency ;;
    hidden: yes
  }

  dimension: division {
    type: string
    sql: ${TABLE}.division ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: email_encoding_key {
    type: string
    sql: ${TABLE}.email_encoding_key ;;
    hidden: yes
  }

  dimension: email_preferences_auto_bcc {
    type: yesno
    sql: ${TABLE}.email_preferences_auto_bcc ;;
    hidden: yes
  }

  dimension: email_preferences_auto_bcc_stay_in_touch {
    type: yesno
    sql: ${TABLE}.email_preferences_auto_bcc_stay_in_touch ;;
    hidden: yes
  }

  dimension: email_preferences_stay_in_touch_reminder {
    type: yesno
    sql: ${TABLE}.email_preferences_stay_in_touch_reminder ;;
    hidden: yes
  }

  dimension: employee_number {
    type: string
    sql: ${TABLE}.employee_number ;;
    hidden: yes
  }

  dimension: extension {
    type: string
    sql: ${TABLE}.extension ;;
    hidden: yes
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
    hidden: yes
  }

  dimension: federation_identifier {
    type: string
    sql: ${TABLE}.federation_identifier ;;
    hidden: yes
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: forecast_enabled {
    type: yesno
    sql: ${TABLE}.forecast_enabled ;;
    hidden: yes
  }

  dimension: full_photo_url {
    type: string
    sql: ${TABLE}.full_photo_url ;;
    hidden: yes
  }

  dimension: geocode_accuracy {
    type: string
    sql: ${TABLE}.geocode_accuracy ;;
    hidden: yes
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: is_profile_photo_active {
    type: yesno
    sql: ${TABLE}.is_profile_photo_active ;;
    hidden: yes
  }

  dimension: jigsaw_import_limit_override {
    type: number
    sql: ${TABLE}.jigsaw_import_limit_override ;;
    hidden: yes
  }

  dimension: language_locale_key {
    type: string
    sql: ${TABLE}.language_locale_key ;;
    hidden: yes
  }

  dimension_group: last_login {
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
    sql: ${TABLE}.last_login_date ;;
    hidden: yes
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.last_modified_by_id ;;
    hidden: yes
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

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension_group: last_password_change {
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
    sql: ${TABLE}.last_password_change_date ;;
    hidden: yes
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

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
    hidden: yes
  }

  dimension: locale_sid_key {
    type: string
    sql: ${TABLE}.locale_sid_key ;;
    hidden: yes
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
    hidden: yes
  }

  dimension: manager_id {
    type: string
    sql: ${TABLE}.manager_id ;;
    hidden: yes
  }

  dimension: mobile_phone {
    type: string
    sql: ${TABLE}.mobile_phone ;;
    hidden: yes
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension_group: offline_pda_trial_expiration {
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
    sql: ${TABLE}.offline_pda_trial_expiration_date ;;
    hidden: yes
  }

  dimension_group: offline_trial_expiration {
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
    sql: ${TABLE}.offline_trial_expiration_date ;;
    hidden: yes
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
    hidden: yes
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
    hidden: yes
  }

  dimension: profile_id {
    type: string
    sql: ${TABLE}.profile_id ;;
    hidden: yes
  }

  dimension: receives_admin_info_emails {
    type: yesno
    sql: ${TABLE}.receives_admin_info_emails ;;
    hidden: yes
  }

  dimension: receives_info_emails {
    type: yesno
    sql: ${TABLE}.receives_info_emails ;;
    hidden: yes
  }

  dimension: sender_email {
    type: string
    sql: ${TABLE}.sender_email ;;
    hidden: yes
  }

  dimension: sender_name {
    type: string
    sql: ${TABLE}.sender_name ;;
    hidden: yes
  }

  dimension: signature {
    type: string
    sql: ${TABLE}.signature ;;
    hidden: yes
  }

  dimension: small_photo_url {
    type: string
    sql: ${TABLE}.small_photo_url ;;
    hidden: yes
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    hidden: yes
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
    hidden: yes
  }


  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }


  dimension: user_role_id {
    type: string
    sql: ${TABLE}.user_role_id ;;
    hidden: yes
  }

  dimension: user_type {
    type: string
    sql: ${TABLE}.user_type ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
    hidden: yes
  }

  dimension: manager {
    type: string
    sql: ${manager.name} ;;
  }


  ### Measure

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      community_nickname,
      company_name,
      last_name,
      sender_name,
      name,
      first_name,
      username,
      account.id,
      account.name,
      contact.name,
      contact.jigsaw_contact_id,
      contact.assistant_name,
      contact.first_name,
      contact.last_name
    ]
  }
}
