# include: "//@{CONFIG_PROJECT_NAME}/owner_opp_sorted.view"
include: "//block-sales-config/owner_opp_sorted.view"

view: owner_opp_sorted {
  extends: [owner_opp_sorted_config]
}

view: owner_opp_sorted_core {
  derived_table: {
    explore_source: opportunity {
      column: name { field: opportunity_owner.name }
      column: total_amount {}
      sort: {
        desc: yes
        field: total_amount
      }
      bind_all_filters: yes
    }
  }
  dimension: name {
    label: "Sorted Name"
    description: "Opportunity Owner (Sorted by total opportunity amount)"
    order_by_field: total_amount
  }
  dimension: total_amount {
    hidden: yes
    type: number
  }
}
