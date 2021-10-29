- dashboard: pipeline_overview
  title: Pipeline Overview
  layout: newspaper
  elements:
  - title: Pipeline Created MTD
    name: Pipeline Created MTD
    model: block-sales_v2
    explore: opportunity
    type: single_value
    fields: [opportunity.total_pipeline_amount]
    filters:
      opportunity.created_date: this month
      opportunity.type: ''
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    show_comparison: false
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields: [opportunity.total_closed_won_new_business_amount, quota_numbers.quarterly_aggregate_quota_measure,
      aggregate_quota.monthly_aggregate_quota_measure]
    y_axes: []
    listen:
      Sales Rep: opportunity_owner.name
      Manager: opportunity_owner.manager
    row: 0
    col: 0
    width: 6
    height: 3
  - title: Pipeline Created QTD
    name: Pipeline Created QTD
    model: block-sales_v2
    explore: opportunity
    type: single_value
    fields: [opportunity.total_pipeline_amount]
    filters:
      opportunity.created_date: this month
      opportunity.type: ''
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    show_comparison: false
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields: [opportunity.total_closed_won_new_business_amount, quota_numbers.quarterly_aggregate_quota_measure,
      aggregate_quota.monthly_aggregate_quota_measure]
    y_axes: []
    listen:
      Sales Rep: opportunity_owner.name
      Manager: opportunity_owner.manager
    row: 0
    col: 6
    width: 6
    height: 3
  - title: Opps by Probability and Close Date
    name: Opps by Probability and Close Date
    model: block-sales_v2
    explore: opportunity
    type: looker_column
    fields: [opportunity.probability_group, opportunity.count, opportunity.close_month]
    pivots: [opportunity.probability_group]
    fill_fields: [opportunity.probability_group, opportunity.close_month]
    filters:
      opportunity.is_pipeline: 'Yes'
      opportunity.close_date: 0 months ago for 6 months
      opportunity.type: ''
    sorts: [opportunity.probability_group, opportunity.close_month desc]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: f582184b-9f56-4e5b-b1ab-e9777faa4df9
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    y_axes: [{label: '', orientation: left, series: [{id: Develop - opportunity.count_new_business,
            name: Develop, axisId: Develop - opportunity.count_new_business}, {id: Develop
              Positive - opportunity.count_new_business, name: Develop Positive, axisId: Develop
              Positive - opportunity.count_new_business}, {id: Negotiate - opportunity.count_new_business,
            name: Negotiate, axisId: Negotiate - opportunity.count_new_business},
          {id: Qualify - opportunity.count_new_business, name: Qualify, axisId: Qualify
              - opportunity.count_new_business}, {id: Qualify Renewal - opportunity.count_new_business,
            name: Qualify Renewal, axisId: Qualify Renewal - opportunity.count_new_business},
          {id: Validate - opportunity.count_new_business, name: Validate, axisId: Validate
              - opportunity.count_new_business}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Sales Rep: opportunity_owner.name
      Manager: opportunity_owner.manager
    row: 11
    col: 12
    width: 12
    height: 9
  - title: Opps in Pipeline
    name: Opps in Pipeline
    model: block-sales_v2
    explore: opportunity
    type: single_value
    fields: [opportunity.count]
    filters:
      opportunity.type: ''
      opportunity.is_pipeline: 'Yes'
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    show_comparison: false
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields: [opportunity.total_closed_won_new_business_amount, quota_numbers.quarterly_aggregate_quota_measure,
      aggregate_quota.monthly_aggregate_quota_measure]
    y_axes: []
    listen:
      Sales Rep: opportunity_owner.name
      Manager: opportunity_owner.manager
    row: 0
    col: 12
    width: 6
    height: 3
  - title: Avg Deal Size in Pipeline
    name: Avg Deal Size in Pipeline
    model: block-sales_v2
    explore: opportunity
    type: single_value
    fields: [opportunity.average_amount]
    filters:
      opportunity.is_pipeline: 'Yes'
    limit: 500
    column_limit: 50
    listen:
      Sales Rep: opportunity_owner.name
      Manager: opportunity_owner.manager
    row: 0
    col: 18
    width: 6
    height: 3
  - title: List of Opportunities in Pipeline
    name: List of Opportunities in Pipeline
    model: block-sales_v2
    explore: opportunity
    type: looker_grid
    fields: [opportunity.name, opportunity.type, opportunity.created_date, opportunity.close_date,
      opportunity.stage_name, opportunity.days_open, opportunity.next_step, opportunity.amount]
    filters:
      opportunity.is_pipeline: 'Yes'
      opportunity.type: ''
    sorts: [opportunity.close_date]
    limit: 500
    column_limit: 50
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      opportunity.amount:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    series_types: {}
    hidden_fields: [opportunity.first_meeting_date, opportunity_history_days_in_current_stage.most_recent_stage_change_date_date,
      opportunity_history_days_in_current_stage.most_recent_stage_change_date]
    listen:
      Sales Rep: opportunity_owner.name
      Manager: opportunity_owner.manager
    row: 32
    col: 0
    width: 24
    height: 6
  - title: Avg Deal Size in Pipeline by Manager
    name: Avg Deal Size in Pipeline by Manager
    model: block-sales_v2
    explore: opportunity
    type: looker_bar
    fields: [opportunity_owner.manager, opportunity.average_amount]
    filters:
      opportunity.is_pipeline: 'Yes'
    sorts: [opportunity.average_amount desc]
    limit: 20
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: opportunity.average_amount,
            id: opportunity.average_amount, name: Average Amount}], showLabels: true,
        showValues: false, unpinAxis: false, tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      opportunity.average_amount: "#E57947"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Sales Rep: opportunity_owner.name
      Manager: opportunity_owner.manager
    row: 20
    col: 0
    width: 12
    height: 12
  - title: Pipeline By Manager
    name: Pipeline By Manager
    model: block-sales_v2
    explore: opportunity
    type: looker_bar
    fields: [opportunity_owner.manager, opportunity.count, opportunity.total_pipeline_amount]
    filters:
      opportunity.is_pipeline: 'Yes'
    sorts: [opportunity.count desc]
    limit: 20
    column_limit: 50
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: opportunity.count, id: opportunity.count,
            name: Number of Opportunities}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: opportunity.total_pipeline_amount,
            id: opportunity.total_pipeline_amount, name: Pipeline Amount}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types:
      opportunity.total_pipeline_amount: line
    point_style: circle
    series_colors:
      opportunity.count: "#E57947"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Sales Rep: opportunity_owner.name
      Manager: opportunity_owner.manager
    row: 20
    col: 12
    width: 12
    height: 12
  - title: Opps by Stage and Lead Source
    name: Opps by Stage and Lead Source
    model: block-sales_v2
    explore: opportunity
    type: looker_column
    fields: [opportunity.lead_source, opportunity.count, opportunity.stage_name]
    pivots: [opportunity.stage_name]
    filters:
      opportunity.is_pipeline: 'Yes'
      opportunity.close_fiscal_quarter: this fiscal quarter
      opportunity.lead_source: "-NULL"
    sorts: [opportunity.count desc 6, opportunity.stage_name 0]
    limit: 5000
    column_limit: 8
    row_total: right
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: f582184b-9f56-4e5b-b1ab-e9777faa4df9
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    y_axes: [{label: '', orientation: bottom, series: [{id: Develop - opportunity.count_new_business,
            name: Develop, axisId: Develop - opportunity.count_new_business}, {id: Develop
              Positive - opportunity.count_new_business, name: Develop Positive, axisId: Develop
              Positive - opportunity.count_new_business}, {id: Negotiate - opportunity.count_new_business,
            name: Negotiate, axisId: Negotiate - opportunity.count_new_business},
          {id: Qualify - opportunity.count_new_business, name: Qualify, axisId: Qualify
              - opportunity.count_new_business}, {id: Qualify Renewal - opportunity.count_new_business,
            name: Qualify Renewal, axisId: Qualify Renewal - opportunity.count_new_business},
          {id: Validate - opportunity.count_new_business, name: Validate, axisId: Validate
              - opportunity.count_new_business}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    legend_position: center
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: asc
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Sales Rep: opportunity_owner.name
      Manager: opportunity_owner.manager
    row: 11
    col: 0
    width: 12
    height: 9
  - title: Opps Slated to Close
    name: Opps Slated to Close
    model: block-sales_v2
    explore: opportunity
    type: looker_scatter
    fields: [opportunity.days_open, opportunity.close_date, opportunity.amount, opportunity.name]
    filters:
      opportunity.is_pipeline: 'Yes'
      opportunity.days_open: "[0, 180]"
      opportunity.close_date: this fiscal quarter
    sorts: [opportunity.days_open]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: be92eae7-de25-46ae-8e4f-21cb0b69a1f3
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{id: opportunity.days_open, name: Opportunity
              Days Open, axisId: opportunity.days_open}], showLabels: true, showValues: true,
        unpinAxis: true, tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    size_by_field: opportunity.amount
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    hide_legend: false
    legend_position: center
    series_types: {}
    point_style: circle
    series_colors:
      opportunity.days_open: "#EE9093"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    x_axis_datetime_label: ''
    y_axis_combined: true
    show_null_points: false
    hidden_fields:
    listen:
      Sales Rep: opportunity_owner.name
      Manager: opportunity_owner.manager
    row: 3
    col: 0
    width: 24
    height: 8
  filters:
  - name: Sales Rep
    title: Sales Rep
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: block-sales_v2
    explore: opportunity
    listens_to_filters: []
    field: opportunity_owner.name
  - name: Manager
    title: Manager
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: block-sales_v2
    explore: opportunity
    listens_to_filters: []
    field: opportunity_owner.manager