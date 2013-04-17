module HashBrowns
  module DisplayHelpers

    def table_styles
      return HashBrowns.conf.table_styles.to_a.join(" ")
    end

    def table_with_header_styles
      return HashBrowns.conf.table_with_header_styles.to_a.join(" ")
    end

    def header_styles(header)
      return HashBrowns.conf.header_styles[header].to_a.join(" ")
    end

    def importantize(key, value)
      value = value.downcase if HashBrowns.conf.ignore_important_case && value.kind_of?(String)
      #puts "k: #{key}, v: #{value}"
      return "nil key" if key.nil?
      return "nil value" if value.nil?
      return "#{key} not important" unless HashBrowns.conf.important.has_key?(key)
      return "#{convert_status(HashBrowns.conf.important[key].call(value))}" if HashBrowns.conf.important[key].kind_of?(Proc)
      return "#{value} not important for #{key}" unless HashBrowns.conf.important[key].has_key?(value)
      return "#{convert_status(HashBrowns.conf.important[key][value])}"
    end

    def convert_status(value)
      value = value.to_s
      return HashBrowns.conf.status_hash[value] if HashBrowns.conf.status_hash.has_key?(value)
      return value
    end

    def display_name(name, table)
      names = HashBrowns.conf.pretty_names[name]
      return name unless names
      return names["all"] if names.has_key?("all")
      return names[table] ? names[table] : name
    end

  end
end
