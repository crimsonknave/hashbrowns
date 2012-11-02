module DisplayHelper
  @pretty_names = Hash.new
  @important = Hash.new

  @status_hash = {
    "green" => "success",
    "blue" => "info",
    "red" => "error",
    "yellow" => "warning"
  }

  @table_styles = Set.new

  VALID_STATUSES = %w(success info warning error)

  def add_status_mapping(name, status)
    raise "Unknown Status" unless VALID_STATUSES.include?(status)
    @status_hash[name] = status
  end

  def add_table_style(style)
    @table_styles.push(style)
  end

  def add_important_name(name, value, status)
    name, value, status = name.to_s, value.to_s, status.to_s
    status = @status_hash[status] if @status_hash.has_key(status)
    if value.kind_of?(Proc)
      @important[name] = value 
      return
    end

    @important[name] = Hash.new unless @important.has_key?(name)
    @important[name][value] = status
  end

  def add_formatted_name(real, formatted, source)
    real, formatted, source = real.to_s, formatted.to_s, source.to_s
    @pretty_names[real] = Hash.new unless @pretty_names.has_key?(real)
    @pretty_names[real][source] = formatted
  end

  def table_styles
    return @table_styles.to_a.join(", ")
  end

  def importantize(key, value)
    return "nil key" if key.nil?
    return "nil value" if value.nil?
    return "#{key} not important" unless @important.has_key?(key)
    return "#{@important[key].call(value)}" if @important[key].kind_of?(Proc)
    return "#{value} not important for #{key}" unless @important[key].has_key?(value)
    return "#{@important[key][value]}"
  end

  def display_name(name, table)
    names = @pretty_names[name]
    return name unless names
    return names[table] ? names[table] : name
    return names["all"] if names.has_key?("all")
  end

end
