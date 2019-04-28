# frozen_string_literal: true

module Yati
  class Configuration
    attr_accessor :primary_locale, :exclude_gems, :ignore_keys

    def initialize
      @primary_locale = :en
      @exclude_gems = true
      @ignore_keys = []
    end
  end
end
