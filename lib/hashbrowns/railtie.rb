require 'hashbrowns/helpers/display_helpers'
require 'hashbrowns/helpers/overview_helpers'
require 'hashbrowns/helpers/links_helpers'
require 'hashbrowns/helpers/relations_helpers'
require 'hashbrowns/helpers/renderer_helpers'
module HashBrowns
  class Railtie < Rails::Engine
    initializer "hashbrowns.view_helpers" do
      ActionView::Base.send :include, DisplayHelpers
      ActionView::Base.send :include, OverviewHelpers
      ActionView::Base.send :include, LinksHelpers
      ActionView::Base.send :include, RelationsHelpers
      ActionView::Base.send :include, RendererHelpers
    end
    paths["app/views"] = "lib/hashbrowns/views"
  end
end
