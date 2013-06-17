ENV['BUNDLE_GEMFILE'] = File.expand_path('../../../../Gemfile', __FILE__)

require 'rubygems'
require 'bundler'

Bundler.setup

$:.unshift File.expand_path('../../../../lib', __FILE__)

require "action_controller/railtie"

Bundler.require

ApplicationController = Class.new(ActionController::Base)

require 'dossier/display'

module Dummy
  class Application < ::Rails::Application
    config.cache_classes = !Rails.env.development?
    config.active_support.deprecation = :stderr
    config.secret_token = 'http://25.media.tumblr.com/d186e6fe2fa1c39a0ba3d7b5980fd598/tumblr_ml1d4eUJFj1s7itpyo1_400.gif'
  end
end

Dummy::Application.initialize!

