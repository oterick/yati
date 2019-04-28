module Yati
  class Phrase < ApplicationRecord
    self.table_name = :yati_phrases

    validates :key, uniqueness: true

    has_many :translations, class_name: 'Yati::Translation'
  end
end
