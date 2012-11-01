module OverviewHelper
  @key_fields = Hash.new

  def add_overview_field(type, value, *path)
    type, value, path = type.to_s, value.to_s, path.map{|p| p.to_s}
    @key_fields[type] = Hash.new unless @key_fields.has_key?(type)
    insert_value(@key_fields[type], value, path)
  end

  def overview_fields(type)
    fields = @key_fields[type]
    return [] unless fields
    return field_parser(type, fields, [])
  end

  def field_parser(k, v, path)
    k, v, path = k.to_s, v.to_s, path.map{|p| p.to_s}
    return "#{k} had nil value at #{path.inspect}" if v.nil?
    return v.map{|i| [display_name(i, path.last), path + [i]] } if k == "values"
    return v.map{|ki, vi| field_parser(ki, vi, path + [k]) }.inject(:+)
  end


  private
  def insert_value(hash, value, path)
    current = path.shift
    if current.nil?
      hash[:values] = Set.new unless hash.has_key(:values)
      hash[:values].push(value)
      return true
    end
    hash[current] = Hash.new unless hash.has_key(current)
    return insert_value(hash, value, path)
  end


end
