require 'active_support'
class TableCloth < Rails::Engine
  paths["app/helpers"] = "lib/helpers"
  paths["app/views"] = "lib/views"
end
