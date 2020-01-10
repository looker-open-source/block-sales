- dashboard: Manager Overview
  title: Manager Overview
  layout: newspaper
  elements:
  - title: Opportunities Won
    name: Opportunities Won
    model: block-sales
    explore: opportunity
    type: single_value
    fields: [opportunity.close_fiscal_quarter, opportunity.count_won]
    pivots: [opportunity.close_fiscal_quarter]
    fill_fields: [opportunity.close_fiscal_quarter]
    filters:
      opportunity.close_date: this fiscal quarter, last fiscal quarter
    sorts: [opportunity.close_fiscal_quarter desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: change, label: Change, expression: 'pivot_index(${opportunity.count_won},
          1) - pivot_index(${opportunity.count_won}, 2)', value_format: !!null '',
        value_format_name: decimal_0, _kind_hint: supermeasure, _type_hint: number}]
    filter_expression: |-
      # Only compare QTDs
      ${opportunity.day_of_fiscal_quarter} <= ${opportunity.current_day_of_fiscal_quarter}
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: ''
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: vs. Last Quarter
    font_size: small
    hidden_fields:
    listen:
      Manager: opportunity_owner.manager
    row: 0
    col: 12
    width: 6
    height: 4
  - title: Pipeline (QTD)
    name: Pipeline (QTD)
    model: block-sales
    explore: opportunity
    type: single_value
    fields: [opportunity.total_pipeline_amount]
    filters:
      opportunity.close_date: this fiscal quarter
    sorts: [opportunity.total_pipeline_new_business_amount desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    show_comparison: false
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: false
    comparison_label: Gap
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: 'true'
    hidden_fields: [opportunity.total_closed_won_new_business_amount]
    listen:
      Manager: opportunity_owner.manager
    row: 0
    col: 0
    width: 6
    height: 4
  - title: Bookings (QTD)
    name: Bookings (QTD)
    model: block-sales
    explore: opportunity
    type: single_value
    fields: [opportunity.total_amount]
    filters:
      opportunity.close_date: this fiscal quarter
    sorts: [opportunity.total_closed_won_new_business_amount desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    show_comparison: false
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Quota
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    font_size: small
    series_types: {}
    hidden_fields: []
    listen:
      Manager: opportunity_owner.manager
    row: 0
    col: 6
    width: 6
    height: 4
  - title: Top 10 Booking Amounts by Title
    name: Top 10 Booking Amounts by Title
    model: block-sales
    explore: opportunity
    type: looker_pie
    fields: [opportunity_owner.title, opportunity.average_amount_won]
    filters:
      opportunity.close_fiscal_quarter: this fiscal quarter
      opportunity.total_amount: ">0"
    sorts: [opportunity.average_amount_won desc]
    limit: 10
    column_limit: 50
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    series_labels:
      opportunity.total_new_closed_won_amount_qtd: Closed Won
      opportunity.total_pipeline_amount: Pipeline
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_diverging1,
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: []}, {type: less than, value: 1, background_color: "#F36254", font_color: !!null '',
        color_application: {collection_id: legacy, palette_id: legacy_diverging1,
          options: {steps: 5, constraints: {max: {type: number, value: 0.1}, min: {
                type: number, value: 0}, mid: {type: number, value: 0.5}}}}, bold: false,
        italic: false, strikethrough: false, fields: []}, {type: between, value: [
          1, 2], background_color: "#FCF758", font_color: !!null '', color_application: {
          collection_id: legacy, palette_id: legacy_diverging1}, bold: false, italic: false,
        strikethrough: false, fields: []}, {type: greater than, value: 2, background_color: "#4FBC89",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_diverging1},
        bold: false, italic: false, strikethrough: false, fields: []}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    subtotals_at_bottom: false
    series_types: {}
    hidden_fields: [opportunity.total_new_closed_won_amount_qtd]
    listen:
      Manager: opportunity_owner.manager
    row: 16
    col: 18
    width: 6
    height: 7
  - title: Win Percentage
    name: Win Percentage
    model: block-sales
    explore: opportunity
    type: single_value
    fields: [opportunity.close_fiscal_quarter, opportunity.win_percentage]
    pivots: [opportunity.close_fiscal_quarter]
    fill_fields: [opportunity.close_fiscal_quarter]
    filters:
      opportunity.close_date: this fiscal quarter, last fiscal quarter
    sorts: [opportunity.close_fiscal_quarter desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: change, label: Change, expression: "(pivot_index(${opportunity.win_percentage},\
          \ 1) - pivot_index(${opportunity.win_percentage}, 2))/pivot_index(${opportunity.win_percentage},\
          \ 2)", value_format: !!null '', value_format_name: percent_0, _kind_hint: supermeasure,
        _type_hint: number}]
    filter_expression: |-
      # Only compare QTDs
      ${opportunity.day_of_fiscal_quarter} <= ${opportunity.current_day_of_fiscal_quarter}
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: ''
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: vs. Last Quarter
    font_size: small
    hidden_fields:
    listen:
      Manager: opportunity_owner.manager
    row: 0
    col: 18
    width: 6
    height: 4
  - title: Rep Performance (QTD)
    name: Rep Performance (QTD)
    model: block-sales
    explore: opportunity
    type: looker_grid
    fields: [opportunity_owner.name, opportunity_owner.tenure, opportunity_owner.title,
      account_owner.manager, opportunity.total_pipeline_amount, opportunity.total_amount]
    filters:
      opportunity.close_fiscal_quarter: this fiscal quarter
    sorts: [opportunity.total_pipeline_amount desc]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_labels:
      opportunity.total_new_closed_won_amount_qtd: Closed Won
      opportunity.total_pipeline_amount: Pipeline
    series_cell_visualizations:
      opportunity.total_pipeline_amount:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825, options: {steps: 5}},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: less
          than, value: 1, background_color: "#3EB0D5", font_color: !!null '', color_application: {
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7, palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825,
          options: {steps: 5, constraints: {max: {type: number, value: 0.1}, min: {
                type: number, value: 0}, mid: {type: number, value: 0.5}}}}, bold: false,
        italic: false, strikethrough: false, fields: []}, {type: between, value: [
          1, 2], background_color: "#3EB0D5", font_color: !!null '', color_application: {
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7, palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: greater
          than, value: 2, background_color: "#3EB0D5", font_color: !!null '', color_application: {
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7, palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825},
        bold: false, italic: false, strikethrough: false, fields: []}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    subtotals_at_bottom: false
    series_types: {}
    hidden_fields: [opportunity.total_new_closed_won_amount_qtd]
    listen:
      Manager: opportunity_owner.manager
    row: 23
    col: 0
    width: 24
    height: 12
  - title: Opportunities Won By Rep (QTD)
    name: Opportunities Won By Rep (QTD)
    model: block-sales
    explore: opportunity
    type: looker_column
    fields: [opportunity_owner.name, opportunity.count_won]
    filters:
      opportunity.close_fiscal_quarter: this fiscal quarter
    sorts: [opportunity.count_won desc]
    limit: 50
    column_limit: 50
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: opportunity.average_days_to_closed_won,
            id: opportunity.average_days_to_closed_won, name: Average Days to Closed
              Won}], showLabels: true, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
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
      opportunity.average_days_to_closed_won: "#592EC2"
      opportunity.count_won: "#4276BE"
    series_labels:
      opportunity.total_new_closed_won_amount_qtd: Closed Won
      opportunity.total_pipeline_amount: Pipeline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_diverging1,
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: []}, {type: less than, value: 1, background_color: "#F36254", font_color: !!null '',
        color_application: {collection_id: legacy, palette_id: legacy_diverging1,
          options: {steps: 5, constraints: {max: {type: number, value: 0.1}, min: {
                type: number, value: 0}, mid: {type: number, value: 0.5}}}}, bold: false,
        italic: false, strikethrough: false, fields: []}, {type: between, value: [
          1, 2], background_color: "#FCF758", font_color: !!null '', color_application: {
          collection_id: legacy, palette_id: legacy_diverging1}, bold: false, italic: false,
        strikethrough: false, fields: []}, {type: greater than, value: 2, background_color: "#4FBC89",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_diverging1},
        bold: false, italic: false, strikethrough: false, fields: []}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    subtotals_at_bottom: false
    hidden_fields: [opportunity.total_new_closed_won_amount_qtd]
    listen:
      Manager: opportunity_owner.manager
    row: 16
    col: 8
    width: 10
    height: 7
  - title: Days To Close By Rep (QTD)
    name: Days To Close By Rep (QTD)
    model: block-sales
    explore: opportunity
    type: looker_bar
    fields: [opportunity.average_days_to_closed_won, opportunity_owner.name]
    filters:
      opportunity.close_fiscal_quarter: this fiscal quarter
      opportunity.total_amount: ">0"
    sorts: [opportunity.average_days_to_closed_won desc]
    limit: 50
    column_limit: 50
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: opportunity.average_days_to_closed_won,
            id: opportunity.average_days_to_closed_won, name: Average Days to Closed
              Won}], showLabels: true, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
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
      opportunity.average_days_to_closed_won: "#592EC2"
    series_labels:
      opportunity.total_new_closed_won_amount_qtd: Closed Won
      opportunity.total_pipeline_amount: Pipeline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_diverging1,
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: []}, {type: less than, value: 1, background_color: "#F36254", font_color: !!null '',
        color_application: {collection_id: legacy, palette_id: legacy_diverging1,
          options: {steps: 5, constraints: {max: {type: number, value: 0.1}, min: {
                type: number, value: 0}, mid: {type: number, value: 0.5}}}}, bold: false,
        italic: false, strikethrough: false, fields: []}, {type: between, value: [
          1, 2], background_color: "#FCF758", font_color: !!null '', color_application: {
          collection_id: legacy, palette_id: legacy_diverging1}, bold: false, italic: false,
        strikethrough: false, fields: []}, {type: greater than, value: 2, background_color: "#4FBC89",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_diverging1},
        bold: false, italic: false, strikethrough: false, fields: []}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    subtotals_at_bottom: false
    hidden_fields: [opportunity.total_new_closed_won_amount_qtd]
    listen:
      Manager: opportunity_owner.manager
    row: 16
    col: 0
    width: 8
    height: 7
  - title: Cumulative Bookings By Rep
    name: Cumulative Bookings By Rep
    model: block-sales
    explore: opportunity
    type: looker_area
    fields: [opportunity_owner.name, opportunity.close_date, opportunity.total_amount]
    pivots: [opportunity_owner.name]
    fill_fields: [opportunity.close_date]
    filters:
      opportunity.close_date: this fiscal quarter
      opportunity.is_won: 'Yes'
    sorts: [opportunity.close_date, opportunity_owner.name 0]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: running_total, label: Running Total, expression: 'running_total(${opportunity.total_amount})',
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: 'true'
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    show_comparison: false
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: false
    comparison_label: Gap
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [opportunity.total_closed_won_new_business_amount, opportunity.total_amount]
    listen:
      Manager: opportunity_owner.manager
    row: 4
    col: 0
    width: 24
    height: 12
  filters:
  - name: Manager
    title: Manager
    type: field_filter
    default_value: Scott Mendelson
    allow_multiple_values: true
    required: false
    model: block-sales
    explore: opportunity
    listens_to_filters: []
    field: opportunity_owner.manager
