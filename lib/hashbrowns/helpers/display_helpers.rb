module HashBrowns
  module DisplayHelpers

    def table_styles
      return HashBrowns.conf.table_styles.to_a.join(" ")
    end

    def importantize(key, value)
      value = value.downcase if HashBrowns.conf.ignore_important_case && value.kind_of?(String)
      #puts "k: #{key}, v: #{value}"
      return "nil key" if key.nil?
      return "nil value" if value.nil?
      return "#{key} not important" unless HashBrowns.conf.important.has_key?(key)
      return "#{HashBrowns.conf.important[key].call(value)}" if HashBrowns.conf.important[key].kind_of?(Proc)
      return "#{value} not important for #{key}" unless HashBrowns.conf.important[key].has_key?(value)
      return "#{HashBrowns.conf.important[key][value]}"
    end

    def display_name(name, table)
      names = HashBrowns.conf.pretty_names[name]
      return name unless names
      return names[table] ? names[table] : name
      return names["all"] if names.has_key?("all")
    end

  end
end
