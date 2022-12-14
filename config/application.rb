require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HappyTeam
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = 'UTC'.freeze
    # config.eager_load_paths << Rails.root.join("extras")

    # Exception handling for custom error pages
    config.exceptions_app = routes

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
