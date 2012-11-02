module RendererHelper
  def render_hash_to_overview(type, object)
    fields = overview_fields(type)
    render :partial => "overview", :fields => fields, :object => object, :type => type
  end

  def render_hash_to_table(object, parent = "")
    render :partial => "recursive_hash_tabler", :object => object, :parent => parent
  end
end
