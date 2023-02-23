require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Webapp
  class Application < Rails::Application
    config.load_defaults 7.0
    config.api_only = true
    # タイムゾーン設定を日本にする
    config.time_zone = "Asia/Tokyo"
    config.active_record.default_timezone = :local

    # ジェネレータの設定を追加
    config.generators do |g|
      g.test_framework :rspec,
        fixtures: false,
        helper_specs: false,
        view_specs: false,
        routing_specs: false
    end
  end
end
