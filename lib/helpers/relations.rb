module RelationsHelper
  @parent_overrides = Set.new

  def add_parent_override(parent)
    @parent_overrides.push(parent)
  end

  def parent_setter(child, parent)
    return parent if @parent_overrides.include?(parent)
    return child
  end
end
