view: marketplace_sales_opportunity {
  sql_table_name: @{SALESFORCE_SCHEMA}.opportunity ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: account_id {
    type: string
    hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
    hidden: yes
  }

  dimension: campaign_id {
    type: string
    hidden: yes
    sql: ${TABLE}.campaign_id ;;
  }

  dimension_group: close {
    type: time
    datatype: date
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.close_date ;;
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
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.created_date ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: expected_revenue {
    type: number
    sql: ${TABLE}.expected_revenue ;;
    hidden: yes
  }

  dimension: fiscal {
    type: string
    hidden: yes
    sql: ${TABLE}.fiscal ;;
  }

  dimension: fiscal_quarter {
    type: number
    sql: ${TABLE}.fiscal_quarter ;;
  }

  dimension: fiscal_year {
    type: number
    sql: ${TABLE}.fiscal_year ;;
  }

  dimension: forecast_category {
    type: string
    sql: ${TABLE}.forecast_category ;;
  }

  dimension: forecast_category_name {
    type: string
    sql: ${TABLE}.forecast_category_name ;;
  }

  dimension: has_open_activity {
    type: yesno
    sql: ${TABLE}.has_open_activity ;;
    group_label: "Status"
  }

  dimension: has_opportunity_line_item {
    type: yesno
    sql: ${TABLE}.has_opportunity_line_item ;;
    group_label: "Status"
  }

  dimension: has_overdue_task {
    type: yesno
    sql: ${TABLE}.has_overdue_task ;;
    group_label: "Status"
  }

  dimension: is_closed {
    type: yesno
    sql: ${TABLE}.is_closed ;;
    group_label: "Status"
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
    group_label: "Status"
  }

  dimension: is_private {
    type: yesno
    sql: ${TABLE}.is_private ;;
    hidden: yes
  }

  dimension: is_won {
    type: yesno
    sql: ${TABLE}.is_won ;;
    group_label: "Status"
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
    sql: ${TABLE}.last_viewed_date ;;
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}.lead_source ;;
  }


  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    link: {
      url:"http://@{SALESFORCE_DOMAIN}/{{ opportunity.id._value }}"
      label: "View in Salesforce"
    }
  }

  dimension: next_step {
    type: string
    sql: ${TABLE}.next_step ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
    hidden: yes
  }

  dimension: pricebook_2_id {
    type: string
    sql: ${TABLE}.pricebook_2_id ;;
    hidden: yes
  }

  dimension: probability {
    type: number
    sql: ${TABLE}.probability ;;
    hidden: yes
  }

#     dimension: source {
#       type: string
#       sql: ${lead_source} ;;
#     }

  dimension: stage_name {
    type: string
    sql: ${TABLE}.stage_name ;;
  }

  dimension: probability_group {
    group_label: "Probability"
    case: {
      when: {
        sql: ${probability} = 100 ;;
        label: "Won"
      }
      when: {
        sql: ${probability} > 80 ;;
        label: "Above 80%"
      }
      when: {
        sql: ${probability} > 60 ;;
        label: "60 - 80%"
      }
      when: {
        sql: ${probability} > 40 ;;
        label: "40 - 60%"
      }
      when: {
        sql: ${probability} > 20 ;;
        label: "20 - 40%"
      }
      when: {
        sql: ${probability} > 0 ;;
        label: "Under 20%"
      }
      when: {
        sql: ${probability} = 0 ;;
        label: "Lost"
      }
    }
  }

  dimension: deal_size_tier {
    type: string
    case: {
      when: {
        label: "$0 - $10K"
        sql: ${amount} < 10000 ;;
      }
      when: {
        label: "$10K - $50K"
        sql: ${amount} < 50000;;
      }
      when: {
        label: "$50K - $100K"
        sql: ${amount} < 100000 ;;
      }
      when: {
        label: "$100K - $500K"
        sql: ${amount} < 500000 ;;
      }
      when: {
        label: "$500K - $1M"
        sql: ${amount} < 1000000 ;;
      }
      when: {
        label: "Over $1M"
        sql: ${amount} > 1000000 ;;
      }
      else: "Amount Unspecified"
    }
    order_by_field: sort_deal_size
  }

  dimension: sort_deal_size {
    type: number
    hidden: yes
    sql: CASE
         WHEN ${amount} < 10000
         THEN 1
         WHEN ${amount} < 50000
         THEN 2
         WHEN ${amount} < 100000
         THEN 3
        WHEN  ${amount} < 500000
         THEN 4
         WHEN ${amount} < 1000000
         THEN 5
         WHEN ${amount} > 1000000
         THEN 6
        ELSE
          7
      END;;
  }

  dimension: id_url {
    sql: ${TABLE}.id ;;
    html: [<a href="https://{{ salesforce_domain_config._sql }}/{{ value }}">Open in SFDC</a>] ;;
    hidden: yes
  }

  dimension: logo64 {
    sql: ${account.domain} ;;
    html: <a href="https://na9.salesforce.com/{{ id._value }}" target="_new">
      <img src="https://logo.clearbit.com/{{ value }}" height=64 width=64></a>
      ;;
  }

  dimension: logo {
    sql: ${account.domain} ;;
    html: <a href="https://{{ value }}" target="_new">
      <img src="https://logo.clearbit.com/{{ value }}" height=128 width=128></a>
      ;;
  }

  dimension: logo32 {
    hidden: yes
    sql: ${account.domain} ;;
    html: <a href="https://na9.salesforce.com/{{ id._value }}" target="_new">
      <img src="https://logo.clearbit.com/{{ value }}" height=32 width=32></a>
      ;;
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

  dimension: total_opportunity_quantity {
    type: number
    sql: ${TABLE}.total_opportunity_quantity ;;
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

  dimension: days_open_tier {
    type: tier
    tiers: [0, 100, 200, 300, 400, 500]
    style: integer
    value_format_name: decimal_0
    sql: CAST(${days_open} as INT64) ;;
  }

  dimension: amount_tier {
    type: tier
    tiers: [0, 50000, 100000, 150000, 200000]
    style: integer
    value_format_name: decimal_0
    sql: CAST(${amount} AS INT64) ;;
  }

  dimension: name_display {
    type: string
    sql: ${name} ;;
    link: {
      url:"http://@{SALESFORCE_DOMAIN}/{{ opportunity.id._value }}"
      label: "View in Salesforce"
    }
  }

  dimension: is_lost {
    type: yesno
    sql: ${is_closed} AND NOT ${is_won} ;;
    group_label: "Status"
  }

  dimension_group: current {
    type: time
    datatype: timestamp
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    hidden: no
    sql: CURRENT_TIMESTAMP() ;;
  }

  dimension: previous_fiscal_quarter {
    type: date_fiscal_quarter
    datatype: date
    sql:  DATE_ADD(${current_date}, INTERVAL -1 QUARTER) ;;
    hidden: yes
  }

  dimension: this_fiscal_quarter_last_year {
    type: date_fiscal_quarter
    datatype: date
    sql:  DATE_ADD(${current_date}, INTERVAL -1 YEAR) ;;
    hidden: yes
  }


  dimension: did_the_close_date_pass {
    type: yesno
    sql: ${current_raw} > ${close_raw} ;;
    group_label: "Status"
  }

# Used in the day_of_quarter
  dimension: fiscal_month_offset {
    type: number
    sql: 0 ;;
    hidden: yes
  }

  # BQ Specific
  # When the user provides a fiscal month offset of >3, wackiness ensues. Therefore we need to modulo to offset before using it in our calculations
  dimension: fiscal_month_offset_modulo {
    type: number
    sql: MOD(${fiscal_month_offset},3) ;;
    hidden: yes
  }

  # BQ Specific
  # When the user provides a fiscal month offset of >3, wackiness ensues. Therefore we need to modulo to offset before using it in our calculations
  dimension: fiscal_month_offset_divide {
    type: number
    sql: DIV(${fiscal_month_offset},3) ;;
    hidden: yes
  }

  # BQ Specific
  # Current day number of fiscal quarter
  dimension: day_of_fiscal_quarter {
    description: "The day of the fiscal quarter the opportunity was closed in."
    group_label: "Close Date"
    type: number
    sql: DATE_DIFF(${close_date}, DATE_ADD(DATE_ADD(CAST(CONCAT(${close_fiscal_quarter}, '-01') as date), INTERVAL ${fiscal_month_offset_modulo} MONTH), INTERVAL ${fiscal_month_offset_divide} QUARTER), day) + 1;;
  }

  dimension: current_day_of_fiscal_quarter {
    group_label: "Current Date"
    type: number
    sql: DATE_DIFF(${current_date}, DATE_ADD(DATE_ADD(CAST(CONCAT(${current_fiscal_quarter}, '-01') as date), INTERVAL ${fiscal_month_offset_modulo} MONTH), INTERVAL ${fiscal_month_offset_divide} QUARTER), day) + 1;;
  }

  # BQ Specific
  # Used specifically on "of Quota" tile as the comparison value
  dimension: beginning_of_this_fiscal_quarter {
    type: string
    sql: DATE_ADD(DATE_ADD(CAST(CONCAT(${current_fiscal_quarter}, '-01') as date), INTERVAL ${fiscal_month_offset_modulo} MONTH), INTERVAL ${fiscal_month_offset_divide} QUARTER) ;;
  }

  dimension: beginning_of_next_fiscal_quarter {
    type: string
    sql: DATE_ADD(DATE_ADD(DATE_ADD(CAST(CONCAT(${current_fiscal_quarter}, '-01') as date), INTERVAL ${fiscal_month_offset_modulo} MONTH), INTERVAL 1 QUARTER), INTERVAL ${fiscal_month_offset_divide} QUARTER) ;;
  }

  dimension: percent_of_quarter_reached {
    type: number
    sql: DATE_DIFF(${current_date}, ${beginning_of_this_fiscal_quarter}, DAY)/DATE_DIFF(${beginning_of_next_fiscal_quarter}, ${beginning_of_this_fiscal_quarter}, DAY) ;;
    value_format_name: percent_0
  }

  # BQ Specific
  dimension: days_open {
    description: "Number of days from opportunity creation to close. If not yet closed, this uses today's date."
    type: number
    sql: CASE WHEN ${is_closed} THEN DATE_DIFF(${close_date}, ${created_date}, DAY)
              ELSE DATE_DIFF(${current_date}, ${created_date}, DAY)
              END ;;
  }

  dimension: days_open_with_opp_name_and_owner {
    description: "Custom dimension that includes Opp name and owner in Days Open."
    type: number
    sql: ${days_open};;
    hidden: yes
    html:  {{ rendered_value }} || {{ opportunity.name._rendered_value }} || {{ opportunity_owner.name._rendered_value }};;
}

  dimension: days_to_closed_won {
    description: "Number of days from opportunity creation to Closed-Won status"
    type: number
    sql: CASE WHEN ${is_closed} AND ${is_won} THEN ${days_open}
                ELSE null
                END ;;
  }

  dimension_group: as_customer  {
    type: duration
    datatype: date
    sql_start: ${close_date}  ;;
    sql_end: current_date ;;
  }

  dimension_group: as_opportunity  {
    type: duration
    datatype: date
    sql_start: ${created_date}  ;;
    sql_end: current_date ;;
  }

  dimension: days_as_opportunity_tier {
    type: tier
    sql: ${days_as_opportunity} ;;
    tiers: [0, 5, 10, 15, 20, 25, 30, 35, 40, 60, 75, 90 ]
    style:integer
    hidden:  yes
  }

  dimension: created_to_closed_in_60 {
    hidden: yes
    type: yesno
    sql: ${days_open} <=60 AND ${is_closed} AND ${is_won} ;;
    drill_fields: [opp_drill_set_closed*]
  }

  dimension: is_pipeline {
    sql: ${forecast_category} IN ('Pipeline','Forecast','BestCase') ;;
    type: yesno
  }


  ###     Measures:

  measure: count {
    type: count
    # drill_fields: [detail*]
    label: "Number of Opportunities"
  }

  measure: total_amount {
    label: "Total Amount"
    type: sum
    sql: ${amount} ;;
    drill_fields: [opp_drill_set_closed*]
    value_format_name: custom_amount_value_format

  }

  measure: average_amount_won {
    label: "Average Amount Won"
    type: average
    sql: ${amount} ;;
    filters: {
      field: is_won
      value: "Yes"
    }
    value_format_name: custom_amount_value_format
  }

  measure: average_amount_lost {
    label: "Average Amount (Closed/Lost)"
    type: average
    sql: ${amount} ;;
    hidden: yes
    filters: {
      field: is_lost
      value: "Yes"
    }
    drill_fields: [opp_drill_set_closed*]
    value_format_name: custom_amount_value_format
  }

  measure: average_amount {
    label: "Average Amount"
    type: average
    sql: ${amount} ;;
    value_format_name: custom_amount_value_format
  }

  measure: total_pipeline_amount {
    label: "Pipeline Amount"
    type: sum
    sql: ${amount} ;;
    filters: {
      field: is_closed
      value: "No"
    }
    filters: {
      field: is_pipeline
      value: "Yes"
    }
    value_format_name: custom_amount_value_format
    drill_fields: [opp_drill_set_open*]
    description: "All open Pipeline Opps"
  }


  # May want to revisit the name here since we're using "is_included_in_quota" rather than "is_new_business"
  # measure: total_pipeline_new_business_amount {
  #   label: "Pipeline {{ amount_display._sql }}"
  #   type: sum
  #   sql: ${amount} ;;
  #   hidden: yes
  #   filters: {
  #     field: is_closed
  #     value: "No"
  #   }
  #   filters: {
  #     field: is_pipeline
  #     value: "Yes"
  #   }
  #   filters: {
  #     field: is_included_in_quota
  #     value: "Yes"
  #   }
  #   value_format_name: custom_amount_value_format
  #   drill_fields: [opp_drill_set_open*]
  #   description: "Only Includes New Business Opportunities"
  # }

  measure: total_pipeline_amount_ytd {
    label: "Pipeline Created YTD"
    type: sum
    sql: ${amount} ;;
    hidden: yes
    filters: {
      field: created_date
      value: "this year"
    }
    filters: {
      field: is_closed
      value: "No"
    }
    filters: {
      field: is_pipeline
      value: "Yes"
    }
    value_format_name: custom_amount_value_format
    drill_fields: [opp_drill_set_closed*]
  }

  measure: total_pipeline_amount_qtd {
    label: "Pipeline Created QTD"
    type: sum
    sql: ${amount} ;;
    hidden: yes
    filters: {
      field: created_date
      value: "this quarter"
    }
    filters: {
      field: is_closed
      value: "No"
    }
    filters: {
      field: is_pipeline
      value: "Yes"
    }
    value_format_name: custom_amount_value_format
    drill_fields: [opp_drill_set_closed*]
  }

  measure: total_closed_won_amount {
    label: "Total Closed Won Amount"
    type: sum
    sql: ${amount}   ;;
    hidden: no
    filters: {
      field: is_won
      value: "Yes"
    }
    value_format_name: custom_amount_value_format
    drill_fields: [opp_drill_set_closed*]
  }

  measure: win_percentage {
    type: number
    sql: ${count_won} / NULLIF(${count_closed},0) ;;
    value_format_name: percent_1
    drill_fields: [name, amount, created_date, close_date]
  }

  measure: count_won {
    label: "Number of Opportunities Won"
    type: count
    filters: {
      field: is_won
      value: "Yes"
    }
    drill_fields: [opp_drill_set_closed*]
  }

  measure: count_won_ytd {
    label: "Number of Opportunities Won - YTD"
    type: count
    hidden: yes
    filters: {
      field: is_won
      value: "Yes"
    }
    filters: {
      field: close_date
      value: "this year"
    }
    drill_fields: [opp_drill_set_closed*]
  }

  ## BQ documentation on AVERAGE function:
  # If a row contains a missing or null value, it is not factored into the calculation.
  # If the entire column contains no values, the function returns a null value.
  measure: average_days_open {
    type: average
    sql: ${days_open} ;;
    value_format_name: decimal_1
    drill_fields: [opp_drill_set_closed*]
  }

  measure: average_days_to_closed_won {
    type: average
    sql: ${days_to_closed_won} ;;
    value_format_name: decimal_0
    drill_fields: [opp_drill_set_closed*]
  }

  measure: count_closed {
    label: "Number of Closed Opportunities"
    type: count
    group_label: "Counts"
    hidden: yes
    filters: {
      field: is_closed
      value: "Yes"
    }
    drill_fields: [opp_drill_set_closed*]
  }

  measure: count_open {
    label: "Number of Open Opportunities"
    type: count
    hidden: yes
    group_label: "Counts"
    filters: {
      field: is_closed
      value: "No"
    }
  }

  measure: count_lost {
    label: "Number of Lost Opportunities"
    type: count
    hidden: yes
    filters: {
      field: is_closed
      value: "Yes"
    }
    filters: {
      field: is_won
      value: "No"
    }
    drill_fields: [opportunity.id, account.name, type]
  }

  measure: open_percentage {
    type: number
    sql: ${count_open} / NULLIF(${count}, 0) ;;
    value_format_name: percent_1
  }

  measure: max_opportunity_amount {
    type: max
    sql: ${amount} ;;
    hidden:  yes
    value_format_name: custom_amount_value_format
    drill_fields: [opp_drill_set_open*, opportunity.custom_stage_name, opportunity.next_step]
  }

  # Referenced in the "account_facts_start_date" NDT that calculates a customer's earliest start date
  measure: earliest_close_date {
    type: date
    hidden: yes
    sql: MIN(${close_raw}) ;;
  }

  measure: amount_per_rep {
    type: number
    label: "Average Amount Won per Rep"
    sql: ${total_amount}/${opportunity_owner.count} ;;
    value_format_name: custom_amount_value_format
  }



  # ----- Sets of fields for drilling ------
  set: opp_drill_set_closed {
    fields: [opportunity.id, opportunity.name, opportunity_owner.name, account.name, close_date, type, days_as_opportunity, amount]
  }
  set: opp_drill_set_open {
    fields: [opportunity.id, opportunity.name, opportunity_owner.name, account.name, created_date, type, days_as_opportunity, amount]
  }

  set: opportunity_exclusion_set {
    fields: [amount_per_rep
      ,logo64
      ,logo
      ]
  }

  # set: opportunity_exclusion_set {
  #   fields: [amount_per_rep
  #         , deals_per_rep
  #         , percent_of_average_new_deal_size
  #         , percent_of_average_sales_cycle
  #         ,logo64
  #         ,logo
  #         ,matches_name_select
  #         ,first_meeting
  #         ,percent_of_quota_reached
  #         , total_closed_won_new_business_amount_leaderboard
  #         , rep_highlight_acv
  #         , average_new_deal_size_won_leaderboard
  #         , rep_highlight_average_new_deal_size_won]
  # }
  }




  # measure: win_to_loss_ratio {
  #   type: number
  #   sql: ${count_new_business_won}/IF(${count_new_business_lost} = 0, 1, ${count_new_business_lost}) ;;
  #   value_format_name: decimal_2
  #   drill_fields: [opp_drill_set_closed*]
  # }


  # measure: deals_per_rep {
  #   type: number
  #   label: "Wins per Rep"
  #   sql: ${count_new_business_won}/${opportunity_owner.count} ;;
  #   value_format: "##.##"
  # }

  # May want to revisit the name here since we're using "is_included_in_quota" rather than "is_new_business"
  # measure: total_new_closed_won_amount_qtd {
  #   label: "Closed Won {{ amount_display._sql }} QTD - Quota"
  #   type: sum
  #   sql: ${amount}   ;;
  #   hidden: yes
  #   filters: {
  #     field: is_won
  #     value: "Yes"
  #   }
  #   filters: {
  #     field: close_date
  #     value: "this fiscal quarter"
  #   }
  #   filters: {
  #     field: is_included_in_quota
  #     value: "yes"
  #   }
  #   value_format_name: custom_amount_value_format
  #   drill_fields: [opp_drill_set_closed*]
  #   description: "New Business Won QTD"
  # }

  # measure: total_closed_won_amount_ytd {
  #   label: "Closed Won {{ amount_display._sql }} YTD  - Quota"
  #   description: "Total amount counted toward quota"
  #   type: sum
  #   sql: ${amount} ;;
  #   hidden: yes
  #   filters: {
  #     field: is_won
  #     value: "Yes"
  #   }
  #   filters: {
  #     field: close_date
  #     value: "this year"
  #   }
  #   filters: {
  #     field: is_included_in_quota
  #     value: "yes"
  #   }
  #   value_format_name: custom_amount_value_format
  #   drill_fields: [opp_drill_set_closed*]
  # }

  # May want to revisit the name here since we're using "is_included_in_quota" rather than "is_new_business"
  #   measure: total_closed_won_new_business_amount { # total_closed for all opp owners
  #     label: "Closed Won {{ amount_display._sql }}"
  #     type: sum
  #     sql: ${amount};;
  # #     hidden: yes
  #     filters: {
  #       field: is_won
  #       value: "yes"
  #     }
  #     filters: {
  #       field: is_included_in_quota
  #       value: "yes"
  #     }
  #     value_format_name: custom_amount_value_format
  #     drill_fields: [opp_drill_set_closed*]
  #     description: "Only Includes Quota Contributing Opportunities"
  #   }

  ### The following Two measures for highlighting in leaderboard bar charts
  # measure: total_closed_won_new_business_amount_leaderboard { # total_closed for all opp owners except selected in opportunity_owner.name_select
  #   label: "Closed Won {{ amount_display._sql }} all Others"
  #   type: sum
  #   sql: CASE WHEN ${opportunity_owner.name} != {% parameter opportunity_owner.name_select %} THEN ${amount} ELSE NULL END ;;
  #   hidden: no
  #   filters: {
  #     field: is_won
  #     value: "yes"
  #   }
  #   filters: {
  #     field: is_included_in_quota
  #     value: "yes"
  #   }
  #   value_format_name: custom_amount_value_format
  #   drill_fields: [opp_drill_set_closed*]
  #   description: "Closed won of all Opportunity Owners except name specified in 'Name Select'. Only Includes Quota Contributing Opportunities"
  # }

  #   measure: rep_highlight_acv { # total_closed for opp owner selected by opportunity_owner.name_select only
  #     type: sum
  #     label: "Closed Won {{ amount_display._sql }} for Selected Owner"
  #     view_label: "Opportunity Owner" # moved from user_core view to avoid possible fanout
  #     sql: CASE WHEN ${opportunity_owner.name} = {% parameter opportunity_owner.name_select %} THEN ${amount} ELSE NULL END ;;
  # #     hidden: yes
  #     filters: {
  #       field: is_won
  #       value: "yes"
  #     }
  #     filters: {
  #       field: is_included_in_quota
  #       value: "yes"
  #     }
  #     value_format_name: custom_amount_value_format
  #     drill_fields: [opp_drill_set_closed*]
  #     description: "Only Includes Quota Contributing Opportunities. Will only show value for Opp Owner selected by 'Name Select'"
  #   }

  # measure: average_new_deal_size {
  #   type: average
  #   sql: ${amount} ;;
  #   hidden: yes
  #   filters: {
  #     field: is_included_in_quota
  #     value: "yes"
  #   }
  #   value_format_name: custom_amount_value_format
  #   drill_fields: [opp_drill_set_closed*]
  # }

  # measure: average_new_deal_size_won {
  #   type: average
  #   sql: ${amount} ;;
  #   hidden: no
  #   filters: {
  #     field: is_included_in_quota
  #     value: "yes"
  #   }
  #   filters: {
  #     field: is_won
  #     value: "yes"
  #   }
  #   value_format_name: custom_amount_value_format
  #   drill_fields: [opp_drill_set_closed*]
  #   description: "Only Includes Quota Contributing Opportunities"
  # }

  ### The following Two measures for highlighting in leaderboard bar charts
  # measure: average_new_deal_size_won_leaderboard {
  #   type: average
  #   label: "Average New Deal size for all Others"

  #   sql: CASE WHEN ${opportunity_owner.name} != {% parameter opportunity_owner.name_select %} THEN ${amount} ELSE NULL END ;;
  #   hidden: no
  #   filters: {
  #     field: is_included_in_quota
  #     value: "yes"
  #   }
  #   filters: {
  #     field: is_won
  #     value: "yes"
  #   }
  #   value_format_name: custom_amount_value_format
  #   drill_fields: [opp_drill_set_closed*]
  #   description: "Average new deal size won of all Opportunity Owners except name specified in 'Name Select'. Only Includes Quota Contributing Opportunities"
  # }

  # measure: rep_highlight_average_new_deal_size_won {
  #   type: average
  #   label: "Average New Deal size for Selected Owner"
  #   sql: CASE WHEN ${opportunity_owner.name} = {% parameter opportunity_owner.name_select %} THEN ${amount} ELSE NULL END ;;
  #   view_label: "Opportunity Owner" # moved from user_core view to avoid possible fanout
  #   hidden: no
  #   filters: {
  #     field: is_included_in_quota
  #     value: "yes"
  #   }
  #   filters: {
  #     field: is_won
  #     value: "yes"
  #   }
  #   value_format_name: custom_amount_value_format
  #   drill_fields: [opp_drill_set_closed*]
  #   description: "Only Includes Quota Contributing Opportunities. Will only show value for Opp Owner selected by 'Name Select'"
  # }



  # measure: average_renew_upsell_size {
  #   type: average
  #   sql: ${amount} ;;
  #   hidden: yes
  #   filters: {
  #     field: is_renewal_upsell
  #     value: "yes"
  #   }
  #   value_format_name: custom_amount_value_format
  #   drill_fields: [opp_drill_set_closed*]
  # }

  # measure: count_new_business_won {
  #   label: "Number of New-Business Opportunities Won"
  #   type: count
  #   hidden: yes
  #   filters: {
  #     field: is_won
  #     value: "Yes"
  #   }

  #   filters: {
  #     field: is_new_business
  #     value: "yes"
  #   }

  #   drill_fields: [opp_drill_set_closed*]
  # }

  # measure: count_new_business_lost {
  #   label: "Number of New-Business Opportunities Lost"
  #   type: count
  #   hidden: yes
  #   filters: {
  #     field: is_won
  #     value: "No"
  #   }

  #   filters: {
  #     field: is_new_business
  #     value: "yes"
  #   }

  #   drill_fields: [opp_drill_set_closed*]
  # }

  # measure: count_new_business_open {
  #   label: "Number of New-Business Opportunities Open"
  #   type: count
  #   hidden: yes
  #   filters: {
  #     field: is_pipeline
  #     value: "Yes"
  #   }
  #   filters: {
  #     field: is_new_business
  #     value: "yes"
  #   }
  #   drill_fields: [opp_drill_set_closed*]
  # }

  # measure: count_new_business_closed {
  #   label: "Number of New-Business Opportunities Closed"
  #   type: count
  #   hidden: yes
  #   filters: {
  #     field: is_closed
  #     value: "Yes"
  #   }

  #   filters: {
  #     field: is_new_business
  #     value: "Yes"
  #   }

  #   drill_fields: [opp_drill_set_closed*]
  # }

  # measure: count_new_business_won_ytd {
  #   label: "Number of New-Business Opportunities Won YTD"
  #   type: count
  #   hidden: yes
  #   filters: {
  #     field: is_won
  #     value: "Yes"
  #   }
  #   filters: {
  #     field: is_new_business
  #     value: "yes"
  #   }
  #   filters: {
  #     field: close_date
  #     value: "this year"
  #   }
  #   drill_fields: [opp_drill_set_closed*]
  # }

  # measure: count_new_business {
  #   label: "Number of New-Business Opportunities"
  #   type: count
  #   hidden: yes
  #   filters: {
  #     field: is_new_business
  #     value: "yes"
  #   }
  #   drill_fields: [opp_drill_set_closed*]
  # }


  # measure: count_renewal_upsell_won {
  #   label: "Number of Renewal/Upsell Opportunities Won"
  #   type: count
  #   hidden: yes
  #   filters: {
  #     field: is_won
  #     value: "Yes"
  #   }
  #   filters: {
  #     field: is_renewal_upsell
  #     value: "yes"
  #   }
  #   drill_fields: [opp_drill_set_closed*]
  # }

  # measure: count_renewal_upsell_won_ytd {
  #   label: "Number of Renewal/Upsell Opportunities Won YTD"
  #   type: count
  #   hidden: yes
  #   filters: {
  #     field: is_won
  #     value: "Yes"
  #   }
  #   filters: {
  #     field: is_renewal_upsell
  #     value: "yes"
  #   }
  #   filters: {
  #     field: close_date
  #     value: "this year"
  #   }
  #   drill_fields: [opp_drill_set_closed*]
  # }


  # measure: count_renewal_upsell {
  #   label: "Number of Renewal/Upsell Opportunities"
  #   type: count
  #   hidden: yes
  #   filters: {
  #     field: is_renewal_upsell
  #     value: "yes"
  #   }
  #   drill_fields: [opp_drill_set_closed*]
  # }

  # measure: total_closed_won_renewal_upsell_amount {
  #   type: sum
  #   sql: ${amount}   ;;
  #   hidden: yes
  #   filters: {
  #     field: is_won
  #     value: "Yes"
  #   }
  #   filters: {
  #     field: is_renewal_upsell
  #     value: "yes"
  #   }
  #   value_format_name: custom_amount_value_format
  #   drill_fields: [opp_drill_set_closed*]
  # }

  # measure: probable_wins {
  #   type: count
  #   hidden: yes
  #   filters: {
  #     field: is_probable_win
  #     value: "yes"
  #   }
  #   filters: {
  #     field: is_closed
  #     value: "no"
  #   }
  #   filters: {
  #     field: is_included_in_quota
  #     value: "yes"
  #   }
  # }

  # measure: number_of_opportunities_that_need_updated_closed_date {
  #   label: "Number of Opportunities That Need Updated Closed Date"
  #   type: count
  #   hidden: yes
  #   filters: {
  #     field: is_included_in_quota
  #     value: "yes"
  #   }
  #   filters: {
  #     field: did_the_close_date_pass
  #     value: "yes"
  #   }
  #   filters: {
  #     field: is_closed
  #     value: "no"
  #   }
  #   drill_fields: [opp_drill_set_closed*, opportunity.custom_stage_name]
  # }

  # measure: number_of_opportunities_with_next_steps {
  #   type: count
  #   hidden: yes
  #   filters: {
  #     field: is_included_in_quota
  #     value: "yes"
  #   }
  #   filters: {
  #     field: is_closed
  #     value: "no"
  #   }
  #   filters: {
  #     field: opportunity.next_step
  #     value: "-NULL"
  #   }
  #   drill_fields: [opp_drill_set_open*, opportunity.custom_stage_name, opportunity.next_step]
  # }

  # measure: number_of_opportunities_requiring_action {
  #   label: "Number of Opportunities That Require Action"
  #   type: count
  #   hidden: yes
  #   filters: {
  #     field: requires_action
  #     value: "yes"
  #   }

  #   drill_fields: [opp_drill_set_open*]
  # }


  #   measure: number_of_upcoming_opportunities {
  #     label: "Number of Upcoming Opportunities"
  #     type: count
  #     hidden: yes
  #     filters: {
  #       field: has_an_upcoming_first_meeting
  #       value: "yes"
  #     }
  #
  #     filters: {
  #       field: is_in_stage_1
  #       value: "yes"
  #     }
  #
  #     drill_fields: [opp_drill_set_open*]
  #
  #   }
  #
  #   measure: number_of_opportunities_with_no_next_steps {
  #     type: count
  #     hidden: yes
  #     filters: {
  #       field: is_included_in_quota
  #       value: "yes"
  #     }
  #     filters: {
  #       field: is_closed
  #       value: "no"
  #     }
  #     filters: {
  #       field: opportunity.next_step
  #       value: "NULL"
  #     }
  #     drill_fields: [opp_drill_set_open*, opportunity.custom_stage_name, opportunity.next_step]
  #   }

  # May want to revisit the name here since we're using "is_included_in_quota" rather than "is_new_business"
  # measure: total_closed_lost_amount {
  #   label: "Closed Lost Amount"
  #   type: average
  #   hidden: yes
  #   sql: ${amount} ;;
  #   filters: {
  #     field: is_included_in_quota
  #     value: "yes"
  #   }
  #   value_format_name: custom_amount_value_format
  #   drill_fields: [opp_drill_set_closed*]
  # }
