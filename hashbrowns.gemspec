# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{hashbrowns}
  s.version = "0.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{crimsonknave}]
  s.date = %q{2012-12-14}
  s.description = %q{Provides a DSL and helpers to convert hashes into html tables.  Allows you to create overviews with selected fields, define keys whose values link to a url and so on.}
  s.email = %q{crimsonknave@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md",
    "TODO"
  ]
  s.files = [
    ".document",
    ".rvmrc",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "TODO",
    "VERSION",
    "example/.gitignore",
    "example/.rvmrc",
    "example/Gemfile",
    "example/Gemfile.lock",
    "example/README.rdoc",
    "example/Rakefile",
    "example/app/assets/images/rails.png",
    "example/app/assets/javascripts/application.js",
    "example/app/assets/javascripts/customers.js.coffee",
    "example/app/assets/javascripts/destinations.js.coffee",
    "example/app/assets/javascripts/orders.js.coffee",
    "example/app/assets/stylesheets/application.css.scss",
    "example/app/assets/stylesheets/bootstrap_and_overrides.css.scss",
    "example/app/assets/stylesheets/customers.css.scss",
    "example/app/assets/stylesheets/destinations.css.scss",
    "example/app/assets/stylesheets/orders.css.scss",
    "example/app/assets/stylesheets/scaffolds.css.scss",
    "example/app/controllers/application_controller.rb",
    "example/app/controllers/customers_controller.rb",
    "example/app/controllers/destinations_controller.rb",
    "example/app/controllers/orders_controller.rb",
    "example/app/helpers/application_helper.rb",
    "example/app/helpers/customers_helper.rb",
    "example/app/helpers/destinations_helper.rb",
    "example/app/helpers/orders_helper.rb",
    "example/app/mailers/.gitkeep",
    "example/app/models/.gitkeep",
    "example/app/models/customer.rb",
    "example/app/models/destination.rb",
    "example/app/models/order.rb",
    "example/app/views/customers/_form.html.erb",
    "example/app/views/customers/edit.html.erb",
    "example/app/views/customers/full.rabl",
    "example/app/views/customers/index.html.erb",
    "example/app/views/customers/index.rabl",
    "example/app/views/customers/new.html.erb",
    "example/app/views/customers/show.html.erb",
    "example/app/views/customers/show.rabl",
    "example/app/views/destinations/_form.html.erb",
    "example/app/views/destinations/edit.html.erb",
    "example/app/views/destinations/full.rabl",
    "example/app/views/destinations/index.html.erb",
    "example/app/views/destinations/index.rabl",
    "example/app/views/destinations/new.html.erb",
    "example/app/views/destinations/show.html.erb",
    "example/app/views/destinations/show.rabl",
    "example/app/views/layouts/application.html.erb",
    "example/app/views/orders/_form.html.erb",
    "example/app/views/orders/edit.html.erb",
    "example/app/views/orders/full.rabl",
    "example/app/views/orders/index.html.erb",
    "example/app/views/orders/index.rabl",
    "example/app/views/orders/new.html.erb",
    "example/app/views/orders/show.html.erb",
    "example/app/views/orders/show.rabl",
    "example/config.ru",
    "example/config/application.rb",
    "example/config/boot.rb",
    "example/config/database.yml",
    "example/config/environment.rb",
    "example/config/environments/development.rb",
    "example/config/environments/production.rb",
    "example/config/environments/test.rb",
    "example/config/initializers/backtrace_silencers.rb",
    "example/config/initializers/hashbrowns.rb",
    "example/config/initializers/inflections.rb",
    "example/config/initializers/mime_types.rb",
    "example/config/initializers/secret_token.rb",
    "example/config/initializers/session_store.rb",
    "example/config/initializers/wrap_parameters.rb",
    "example/config/locales/en.yml",
    "example/config/routes.rb",
    "example/db/migrate/20121102164922_create_customers.rb",
    "example/db/migrate/20121102165116_create_orders.rb",
    "example/db/migrate/20121102165208_create_destinations.rb",
    "example/db/schema.rb",
    "example/db/seeds.rb",
    "example/lib/assets/.gitkeep",
    "example/lib/tasks/.gitkeep",
    "example/log/.gitkeep",
    "example/public/404.html",
    "example/public/422.html",
    "example/public/500.html",
    "example/public/favicon.ico",
    "example/public/index.html",
    "example/public/robots.txt",
    "example/script/rails",
    "example/test/fixtures/.gitkeep",
    "example/test/fixtures/customers.yml",
    "example/test/fixtures/destinations.yml",
    "example/test/fixtures/orders.yml",
    "example/test/functional/.gitkeep",
    "example/test/functional/customers_controller_test.rb",
    "example/test/functional/destinations_controller_test.rb",
    "example/test/functional/orders_controller_test.rb",
    "example/test/integration/.gitkeep",
    "example/test/performance/browsing_test.rb",
    "example/test/test_helper.rb",
    "example/test/unit/.gitkeep",
    "example/test/unit/customer_test.rb",
    "example/test/unit/destination_test.rb",
    "example/test/unit/helpers/customers_helper_test.rb",
    "example/test/unit/helpers/destinations_helper_test.rb",
    "example/test/unit/helpers/orders_helper_test.rb",
    "example/test/unit/order_test.rb",
    "example/vendor/assets/javascripts/.gitkeep",
    "example/vendor/assets/stylesheets/.gitkeep",
    "example/vendor/plugins/.gitkeep",
    "hashbrowns.gemspec",
    "lib/hashbrowns.rb",
    "lib/hashbrowns/configuration.rb",
    "lib/hashbrowns/helpers/display_helpers.rb",
    "lib/hashbrowns/helpers/links_helpers.rb",
    "lib/hashbrowns/helpers/overview_helpers.rb",
    "lib/hashbrowns/helpers/relations_helpers.rb",
    "lib/hashbrowns/helpers/renderer_helpers.rb",
    "lib/hashbrowns/railtie.rb",
    "lib/hashbrowns/views/hashbrowns/_overview.html.haml",
    "lib/hashbrowns/views/hashbrowns/_recursive_hash_tabler.html.haml",
    "test/helper.rb",
    "test/test_hash_tabler.rb"
  ]
  s.homepage = %q{http://github.com/crimsonknave/hashbrowns}
  s.licenses = [%q{MIT}]
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.9}
  s.summary = %q{Cooks your hashes into html}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<haml-rails>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
    else
      s.add_dependency(%q<haml-rails>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<rdoc>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
    end
  else
    s.add_dependency(%q<haml-rails>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<rdoc>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
  end
end

