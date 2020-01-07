# connection: "@{CONNECTION_NAME}"

# temp - for dev
connection: "app-salesforce"


include: "*.view.lkml"
include: "*.explore.lkml"
include: "*.dashboard.lookml"
# include: "//@{CONFIG_PROJECT_NAME}/*.view.lkml"
# include: "//@{CONFIG_PROJECT_NAME}/*.model.lkml"

# temp - for dev
include: "//block-sales-config/*.view.lkml"
include: "//block-sales-config/*.model.lkml"

explore: lead {
  extends: [lead_config]
  hidden: no
}

explore: contact {
  extends: [contact_config]
  hidden: no
}

explore: opportunity {
  extends: [opportunity_config]
  hidden: no
}

explore: account {
  extends: [account_config]
  hidden: no
}
