module HashBrowns
  module RendererHelpers
    def render_hash_to_overview(type, object)
      #We don't pass in overview_fields here once because we shift the path and that messes up the case the overview is an array
      render :partial => "hashbrowns/overview", :locals => { :object => object, :type => type }
    end

    def render_hash_to_table(object, parent = "")
      render :partial => "hashbrowns/recursive_hash_tabler", :locals => {:object => object, :parent => parent}
    end
  end
end
