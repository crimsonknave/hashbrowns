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

  config.add_overview_field(:destinations, :address1)
  config.add_overview_field(:destinations, :city)
  config.add_overview_field(:destinations, :name, :order)
  config.add_overview_field(:destinations, :status, :order)


  config.add_formatted_name(:name, :order_name, :orders)
  config.add_formatted_name(:name, :order_name, :order)
  config.add_formatted_name(:status, :order_status, :order)

  #Must also set up parent hash for these
  config.add_links_for_id(:order_name, [:order, :orders])
  config.add_link_by_parents([:order, :orders], :id, "/orders/")
  
  config.add_important_name(:order_status, :pending, :green)

  config.ignore_important_case = true

end
