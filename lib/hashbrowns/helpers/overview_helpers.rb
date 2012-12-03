module HashBrowns
  module OverviewHelpers

    def overview_fields(type)
      type = type.to_s
      fields = HashBrowns.conf.key_fields[type]
      return [] unless fields
      #puts "calling field parser now"
      return field_parser(type, fields, [])
    end

    def field_parser(k, v, path)
      k, path = k.to_s, path.map{|p| p.to_s}
      return "#{k} had nil value at #{path.inspect}" if v.nil?
      return v.map{|i| [display_name(i, path.last), path + [i]] } if k == "values"
      return v.map{|ki, vi| field_parser(ki, vi, path + [k]) }.inject(:+)
    end

  end
end
