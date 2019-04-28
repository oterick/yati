# frozen_string_literal: true

module Yati
  module Utils
    module_function

    def self.flat_translation_hash(hash, prefixes = [], result = {})
      return result.update({ prefixes => hash }) unless hash.is_a?(Hash)

      hash.each { |key, value| flat_translation_hash(value, prefixes + [key], result) }

      join = Proc.new { |key, value| [key.join('.'), value] }

      result.map(&join).to_h
    end
  end
end
