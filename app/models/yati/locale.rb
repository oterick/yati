module Yati
  class Locale < ApplicationRecord
    self.table_name = :yati_locales

    has_many :translations, class_name: 'Yati::Translations', dependent: :destroy
    has_many :phrases, through: :translations, class_name: 'Yati::Phrase'

    validates :name, presence: true, uniqueness: { case_sensitive: false }

    PLURALIZATION_KEYS = %i[none zero one two few many other]

    scope :primary, -> { find_by(name: Yati.config.primary_locale) }
    scope :not_primary, -> { where.not(name: Yati.config.primary_locale) }

    def name
      attributes['name'].to_sym
    end

    def self.pluralization_data?(data)
      #keys = data.keys.map(&:to_sym)
      PLURALIZATION_KEYS.all? { |key| data.has_key?(key) }
      #keys.all? { |key| PLURALIZATION_KEYS.include?(key) }
    end
  end
end
