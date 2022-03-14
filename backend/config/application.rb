require_relative "boot"

require "rails"      
# Pick the frameworks you want:     
require "active_model/railtie"      
require "active_job/railtie"        
require "active_record/railtie"     
require "action_controller/railtie"     
require "action_mailer/railtie"     
require "action_view/railtie"       
require "action_cable/engine"       
# require "sprockets/railtie"       
require "rails/test_unit/railtie"
require "active_storage/engine"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    config.api_only = true
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.time_zone = ENV["TZ"]
    config.active_record.default_timezone = :utc
    config.i18n.default_locale = :ja
    config.add_autoload_paths_to_load_path = false

    config.autoload_paths += %W(#{config.root}/lib/validator)

    config.session_store :cookie_store, key: '_interslice_session'
    config.middleware.use ActionDispatch::Cookies # Required for all session management
    config.middleware.use ActionDispatch::Session::CookieStore, config.session_options
    config.middleware.use ActionDispatch::Flash
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*',
                 :headers => :any,
                 :expose => ['access-token', 'expiry', 'token-type', 'uid', 'client'],
                 :methods => [:get, :post, :options, :delete, :put]
      end
    end
    # config.action_controller.default_protect_from_forgery = true
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.generators do |g|
      g.test_framework :rspec,
            view_specs: false,
            helper_specs: false,
            controller_specs: false,
            routing_specs: false
    end
  end
end
