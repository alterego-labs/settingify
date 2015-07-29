require 'singleton'

module Settingify
  class Repo
    include Singleton

    def list
      @settings_list ||= []
      @settings_list
    end

    def add(item)
      list << item
    end
  end
end
