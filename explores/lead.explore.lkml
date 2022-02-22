include: "/views/*.view"

explore: lead {
  view_name: lead
  from: marketplace_sales_lead
  #  fields: [ALL_FIELDS*,-opportunity.opportunity_exclusion_set*, -account.account_exclusion_set*, -quota.quota_exclusion_set*]
  fields: [ALL_FIELDS*,-opportunity.opportunity_exclusion_set*]
  sql_always_where: NOT ${lead.is_deleted}
    ;;

  join: lead_owner {
    from: marketplace_sales_user
    sql_on: ${lead.owner_id} = ${lead_owner.id} ;;
    relationship: many_to_one
  }

  join: account {
    from: marketplace_sales_account
    sql_on: ${lead.converted_account_id} = ${account.id} ;;
    relationship: many_to_one
  }

  join: account_owner {
    from: marketplace_sales_user
    sql_on: ${account.owner_id} = ${account_owner.id} ;;
    relationship: many_to_one
  }

  join: contact {
    from: marketplace_sales_contact
    sql_on: ${lead.converted_contact_id} = ${contact.id} ;;
    relationship: many_to_one
  }

  join: opportunity {
    from: marketplace_sales_opportunity
    sql_on: ${lead.converted_opportunity_id} = ${opportunity.id} ;;
    relationship: many_to_one
  }

  join: opportunity_owner {
    from: marketplace_sales_user
    sql_on: ${opportunity.owner_id} = ${opportunity_owner.id} ;;
    relationship: many_to_one
  }

  join: manager {
    from: marketplace_sales_user
    sql_on: ${opportunity_owner.manager_id} = ${manager.id};;
    fields: []
    relationship: many_to_one
  }

  join: task {
    from: marketplace_sales_task
    sql_on: ${task.who_id} = ${lead.id} ;;
    relationship: one_to_many
  }
}
