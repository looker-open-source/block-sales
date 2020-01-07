
explore: opportunity_core {
  extension: required
  view_name: opportunity
  fields: [ALL_FIELDS*]
  sql_always_where: NOT ${opportunity.is_deleted} ;;

  join: account {
    sql_on: ${opportunity.account_id} = ${account.id} ;;
    relationship: many_to_one
  }
  join: account_owner {
    from: user
    sql_on: ${account.owner_id} = ${account_owner.id} ;;
    relationship: many_to_one
  }
  join: campaign {
    sql_on: ${opportunity.campaign_id} = ${campaign.id} ;;
    relationship: many_to_one
  }
  join: opportunity_owner {
    from: user
    type: full_outer # Needed full outer here since we want to include reps regardless of whether or not they own an opp
    sql_on: ${opportunity.owner_id} = ${opportunity_owner.id} ;;
    relationship: many_to_one
  }
  join: manager {
    from: user
    sql_on: ${opportunity_owner.manager_id} = ${manager.id};;
    relationship: many_to_one
  }
  join: task {
    sql_on: ${opportunity.id} = ${task.what_id} ;;
    relationship: one_to_many
  }
  # join: opportunity_stage_history {
  #   sql_on:  ${opportunity.id} = ${opportunity_stage_history.opportunity_id} ;;
  #   relationship: one_to_one
  # }
  # join: user_age {
  #   view_label: "Opportunity Owner"
  #   sql_on: ${user_age.owner_id} = ${opportunity_owner.id} AND ${user_age.opportunity_id} = ${opportunity.id};;
  #   relationship: many_to_many
  # }

#   join: account_facts_start_date {
#     view_label: "Account Facts"
#     sql_on: ${account_facts_start_date.account_id} = ${account.id} ;;
#     relationship: one_to_one
#   }
#
#   join: account_facts_customer_lifetime_value {
#     view_label: "Account Facts"
#     sql_on: ${account_facts_customer_lifetime_value.account_id} = ${account.id} ;;
#     relationship: one_to_one
#   }
#
#   join: quota {
#     view_label: "Quota"
#     sql_on: ${quota.name} = ${opportunity_owner.name} ;;
#     relationship: one_to_one
#   }
#
#   join: aggregate_quota {
#     sql_on: ${aggregate_quota.quota_start_fiscal_quarter} = ${opportunity.close_fiscal_quarter}  ;;
#     relationship: many_to_one
#   }
#
#   join: manager_quota {
#     sql_on: ${manager_quota.quota_start_fiscal_quarter} = ${quota.quota_start_fiscal_quarter}
#       AND ${manager_quota.id} = ${manager.id} ;;
#     relationship: many_to_one
#   }
#     join: quota_aggregation {
#       view_label: "Quota"
#       sql_on: ${quota_aggregation.ae_segment} = ${quota.ae_segment} ;;
#       relationship: one_to_one
#     }
#
#  -----
#
#   join: first_meeting {
#     view_label: "Opportunity"
#     sql_on: ${opportunity.id} = ${first_meeting.opportunity_id} ;;
#     relationship: one_to_one
#   }
#   join: first_deal_closed {
#     sql_on: ${first_deal_closed.opportunity_owner_id} = ${opportunity_owner.id} ;;
#     relationship: one_to_one
#   }
#   join: account_facts_is_customer {
#     view_label: "Account"
#     sql_on: ${account_facts_is_customer.account_id} = ${account.id} ;;
#     relationship: one_to_one
#   }

}
