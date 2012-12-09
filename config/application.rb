require File.expand_path('../boot', __FILE__)

require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "sprockets/railtie"

if defined?(Bundler)
  Bundler.require(*Rails.groups(:assets => %w(development test)))
end

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
    config.active_record.whitelist_attributes = true
    config.assets.enabled = true
    config.assets.version = '1.0'
    configatron.configure_from_hash(YAML.load(ERB.new(File.read("#{Rails.root}/config/config.yml")).result)[Rails.env])
  end
end
