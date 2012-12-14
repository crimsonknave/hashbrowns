module HashBrowns
  module LinksHelpers
    def linkify(key, value, parent = false, id = false, text = false)
      return "" if value.nil? or key.nil?
      return "false" if value == "false"
      #puts "k #{key}, v #{value}, p #{parent} i #{id} t #{text} vc #{value.class}"
      key, value, parent, id, text = key.to_s, value.to_s, parent.to_s, id.to_s, text.to_s
      text = value if text
      return link_to(text, HashBrowns.conf.link_parents[parent][key]+value).html_safe if parent && HashBrowns.conf.link_parents.has_key?(parent) && HashBrowns.conf.link_parents[parent].has_key?(key)
      return link_to(text, HashBrowns.conf.link_hash[key]+value).html_safe if HashBrowns.conf.link_hash.has_key?(key)
      return link_to(text, value).html_safe if HashBrowns.conf.links.include?(key)
      return link_to(text, HashBrowns.conf.link_parents[parent]["id"]+id).html_safe if id && parent && HashBrowns.conf.link_for_id.has_key?(key) && HashBrowns.conf.link_for_id[key].include?(parent)
      return value
    end

    def get_value_and_id(object, path)
      #puts "o #{object.inspect} p #{p.inspect}"
      value = object[path.shift.to_s]
      value = "false" if value.nil?
      #puts "value is '#{value}'"
      return value.to_s, object["id"] if path.empty? or value.nil?
      return get_value_and_id(value, path)
    end
  end
end
