module HashBrowns
  module RendererHelpers
    def render_hash_to_overview(type, object)
      fields = overview_fields(type)
      puts fields.inspect
      render :partial => "hashbrowns/overview", :locals => { :fields => fields, :object => object, :type => type }
    end

    def render_hash_to_table(object, parent = "")
      render :partial => "hashbrowns/recursive_hash_tabler", :locals => {:object => object, :parent => parent}
    end
  end
end
