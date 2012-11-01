module LinkHelper
  @link_hash = Hash.new
  @link_for_id = Hash.new
  @links = Set.new
  @link_parents = Hash.new

  def add_external_link(name)
    @links.push name.to_s
  end

  def add_link_for_id(key, parent)
    @link_for_id[key.to_s] = parent.to_s
  end

  def add_link_by_key(key, path)
    @link_hash[key.to_s] = path.to_s
  end

  def add_link_by_parent(parent, key, path)
    if @link_parents.has_key?(parent.to_s)
      @link_parents[parent.to_s][key.to_s] = path.to_s
    else
      @link_parents[parent.to_s] = { key.to_s => path.to_s }
    end
  end

  def linkify(key, value, parent = false, id = false, text = false)
    return "" if value.nil? or key.nil?
    key, value, parent, id, text = key.to_s, value.to_s, parent.to_s, id.to_s, text.to_s
    text = value unless text
    return link_to(text, @link_parents[parent][key]+value).html_safe if parent && @link_parents.has_key?(parents) && @link_parents[parent].has_key?(key)
    return link_to(text, @link_hash[key]+value).html_safe if @link_hash.has_key?(key)
    return link_to(text, value).html_safe if @links.include?(key)
    return link_to(text, @link_parents[parent]["id"]+id).html_safe if id && parent && @link_for_id.has_key?(key) && @link_for_id[key].include(parent)
    return value
  end


end
