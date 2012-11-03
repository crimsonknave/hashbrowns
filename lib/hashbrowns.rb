require 'hashbrowns/railtie' if defined?(Rails)
require 'haml'
require 'hashbrowns/configuration'

module HashBrowns
  class << self
    def configure(&block)
      yield(conf)
      conf
    end

    def conf
      @_configuration ||= Configuration.new
    end
  end
end
