
view: marketplace_sales_task {
  sql_table_name: @{SALESFORCE_SCHEMA}.task ;;

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

  dimension: account_id {
    type: string
    hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension_group: activity {
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
    sql: ${TABLE}.activity_date ;;
  }

  dimension: call_disposition {
    type: string
    hidden: yes
    sql: ${TABLE}.call_disposition ;;
  }

  dimension: call_duration_in_seconds {
    type: number
    hidden: yes
    sql: ${TABLE}.call_duration_in_seconds ;;
  }

  dimension: call_object {
    type: string
    hidden: yes
    sql: ${TABLE}.call_object ;;
  }

  dimension: call_type {
    type: string
    sql: ${TABLE}.call_type ;;
  }

  dimension: created_by_id {
    type: string
    hidden: yes
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

  dimension: currency_iso_code {
    type: string
    hidden: yes
    sql: ${TABLE}.currency_iso_code ;;
  }

  dimension: description {
    type: string
    sql: CONCAT(SUBSTR(${TABLE}.description,0,130), "...") ;;
  }

  dimension: is_closed {
    type: yesno
    sql: ${TABLE}.is_closed ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_high_priority {
    type: yesno
    sql: ${TABLE}.is_high_priority ;;
  }

  dimension: is_recurrence {
    type: yesno
    sql: ${TABLE}.is_recurrence ;;
  }

  dimension: is_reminder_set {
    type: yesno
    hidden: yes
    sql: ${TABLE}.is_reminder_set ;;
  }

  dimension: last_modified_by_id {
    type: string
    hidden: yes
    sql: ${TABLE}.last_modified_by_id ;;
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

  dimension: priority {
    type: string
    sql: ${TABLE}.priority ;;
  }

  dimension: record_type_id {
    type: string
    hidden: yes
    sql: ${TABLE}.record_type_id ;;
  }

  dimension: recurrence_activity_id {
    type: string
    hidden: yes
    sql: ${TABLE}.recurrence_activity_id ;;
  }

  dimension: recurrence_day_of_month {
    type: number
    hidden: yes
    sql: ${TABLE}.recurrence_day_of_month ;;
  }

  dimension: recurrence_day_of_week_mask {
    type: number
    hidden: yes
    sql: ${TABLE}.recurrence_day_of_week_mask ;;
  }

  dimension_group: recurrence_end_date_only {
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
    sql: ${TABLE}.recurrence_end_date_only ;;
  }

  dimension: recurrence_instance {
    type: string
    hidden: yes
    sql: ${TABLE}.recurrence_instance ;;
  }

  dimension: recurrence_interval {
    type: number
    hidden: yes
    sql: ${TABLE}.recurrence_interval ;;
  }

  dimension: recurrence_month_of_year {
    type: string
    hidden: yes
    sql: ${TABLE}.recurrence_month_of_year ;;
  }

  dimension: recurrence_regenerated_type {
    type: string
    hidden: yes
    sql: ${TABLE}.recurrence_regenerated_type ;;
  }

  dimension_group: recurrence_start_date_only {
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
    sql: ${TABLE}.recurrence_start_date_only ;;
  }

  dimension: recurrence_time_zone_sid_key {
    type: string
    hidden: yes
    sql: ${TABLE}.recurrence_time_zone_sid_key ;;
  }

  dimension: recurrence_type {
    type: string
    hidden: yes
    sql: ${TABLE}.recurrence_type ;;
  }

  dimension_group: reminder_date {
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
    sql: ${TABLE}.reminder_date_time ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
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

  dimension: task_subtype {
    type: string
    hidden: yes
    sql: ${TABLE}.task_subtype ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: what_id {
    type: string
    hidden: yes
    sql: ${TABLE}.what_id ;;
  }

  dimension: who_id {
    type: string
    hidden: yes
    sql: ${TABLE}.who_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, account.id, account.name]
  }

  measure: emails {
    type: count
    filters: {
      field: type
      value: "Email"
    }
  }

  measure: calls {
    type: count
    filters: {
      field: type
      value: "Call"
    }
  }

  measure: meetings {
    type: count
    filters: {
      field: type
      value: "%Meeting%"
    }
  }
}
