module HashBrowns
  module RelationsHelpers

    def parent_setter(child, parent)
      return parent if HashBrowns.conf.parent_overrides.include?(parent)
      return child
    end
  end
end
