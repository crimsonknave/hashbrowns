HashBrowns.configure do |config|
  config.add_table_style("table")
  config.add_table_style("table-bordered")
  config.add_table_style("table-striped")
  config.add_table_styles("table-hover","table-condensed")

  config.add_overview_field(:customers, :first_name)
  config.add_overview_field(:customers, :last_name)
  #This is an array, don't support that yet/ever?
  #config.add_overview_field(:customers, :name, :orders)

  config.add_overview_field(:orders, :name)
  config.add_overview_field(:orders, :first_name, :customer)
  config.add_overview_field(:orders, :last_name, :customer)

  config.add_formatted_name(:name, :order_name, :orders)
end
