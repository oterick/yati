# frozen_string_literal: true

require 'rails'

module Yati
  class Engine < ::Rails::Engine
    isolate_namespace Yati
  end
end
