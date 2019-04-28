module Yati
  class Translation < ApplicationRecord
    self.table_name = :yati_translations

    belongs_to :phrase, class_name: 'Yati::Phrase'
    belongs_to :locale, class_name: 'Yati::Locale'
  end
end
