require File.expand_path('../boot', __FILE__)

require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

Bundler.require(:default, Rails.env)

module RGyazo
  class Application < Rails::Application
    config.generators do |g|
      g.assets     false
      g.helper     false
    end
    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.active_support.escape_html_entities_in_json = true
    config.assets.enabled = true
    config.assets.version = '1.0'
    configatron.configure_from_hash(YAML.load_erb_file(Rails.root.join('config', 'config.yml'))[Rails.env])
    config.middleware.use Rack::Health, path: '/healthy'
  end
end
