module HashBrowns
  class Configuration
    attr_accessor :link_hash, :link_for_id, :links, :link_parents, :key_fields, :parent_overrides, :status_hash, :table_styles, :key_fields, :pretty_names, :important, :ignore_important_case

    VALID_STATUSES = %w(success info warning error)

    def initialize
      @link_hash = Hash.new
      @link_for_id = Hash.new
      @links = Set.new
      @link_parents = Hash.new
      @pretty_names = Hash.new
      @important = Hash.new
      @ignore_important_case = false

      @status_hash = {
        "green" => "success",
        "blue" => "info",
        "red" => "error",
        "yellow" => "warning"
      }

      @table_styles = Set.new
      @key_fields = Hash.new
      @parent_overrides = Set.new

    end

    def add_status_mapping(name, status)
      raise "Unknown Status" unless VALID_STATUSES.include?(status)
      @status_hash[name] = status
    end

    def add_table_style(style)
      @table_styles.add(style)
    end
    def add_table_styles(*styles)
      @table_styles.merge(styles)
    end

    def add_parent_overrides(*parents)
      @parent_overrides.merge(parents)
    end

    def add_parent_override(parent)
      @parent_overrides.add(parent)
    end

    def add_overview_field(type, value, *path)
      type, value, path = type.to_s, value.to_s, path.map{|p| p.to_s}
      @key_fields[type] = Hash.new unless @key_fields.has_key?(type)
      insert_value(@key_fields[type], value, path)
    end

    def add_important_name(name, value, status)
      name, value, status = name.to_s, value.to_s, status.to_s
      value = value.downcase if @ignore_important_case && value.kind_of?(String)
      status = @status_hash[status] if @status_hash.has_key?(status)
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

    def add_external_links(*names)
      @links.merge names.map{|x| x.to_s}
    end

    def add_external_link(name)
      @links.add name.to_s
    end

    def add_link_for_id(key, parent)
      key = key.to_s
      @link_for_id[key] = Set.new if @link_for_id[key].nil?
      @link_for_id[key].add(parent.to_s)
    end

    def add_links_for_id(key, parents)
      key = key.to_s
      @link_for_id[key] = Set.new if @link_for_id[key].nil?
      @link_for_id[key].merge(parents.map(&:to_s))
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

    def add_link_by_parents(parents, key, path)
      parents.each do |parent|
        if @link_parents.has_key?(parent.to_s)
          @link_parents[parent.to_s][key.to_s] = path.to_s
        else
          @link_parents[parent.to_s] = { key.to_s => path.to_s }
        end
      end
    end

    private
    def insert_value(hash, value, path)
      current = path.shift
      if current.nil?
        hash[:values] = Set.new unless hash.has_key?(:values)
        hash[:values].add(value)
        return true
      end
      hash[current] = Hash.new unless hash.has_key?(current)
      return insert_value(hash[current], value, path)
    end

  end
end
