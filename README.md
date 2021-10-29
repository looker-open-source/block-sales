# Sales Block

This repository contains views, explores and dashboards that make up the Sales Block.

## Dashboards
There are 4 dashboards that come with this block, with each dashboard focusing on a specific area of the sales process.
- Sales Overivew
- Pipeline Management
- Manager Overview
- Sales Rep Performance

## Installation and Customization
This block is installed on the Looker Marketplace. The LookML constants are used to specify the name of the schema and connection and will are defined during the installation process.

The main LookML content will be imported, and is customized using Refinements. For more information on using refinements to customize marketplace blocks, please see [this documentation](https://docs.looker.com/data-modeling/marketplace/customize-blocks).

## Source
This Block is modeled on the schema brough in by Fivetran's [Salesforce connector](https://fivetran.com/docs/applications/salesforce). It will bring over all the tables that are available in the [Salesforce Schema](https://developer.salesforce.com/docs/atlas.en-us.api.meta/api/data_model.htm).
