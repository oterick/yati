# frozen_string_literal: true

require 'yati/version'
require 'yati/configuration'
require 'yati/utils'
require 'yati/engine'

module Yati
  class Error < StandardError; end

  module_function

  def config
    @config ||= Configuration.new
  end

  def configure
    yield config
  end
end
