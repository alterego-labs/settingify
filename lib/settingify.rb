require 'active_record'
require 'active_record/version'
require 'active_support/core_ext/module'

require "settingify/version"

module Settingify
  extend ActiveSupport::Autoload

  autoload :Setting
end
