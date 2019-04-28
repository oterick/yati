# frozen_string_literal: true

module Yati
  class Tasks
    def self.import_locales
      locales = Yati::Locale.not_primary

      locales.each do |locale|
        import_locale(locale)
      end
    end

    def self.import_locale(locale)
      data = locale.read_locale_file
    end

    def self.load_primary
      new_keys = 0
      updated_keys = 0
      locale = Yati::Locale.primary
      puts "Loading primary locale (#{locale.name})..."

      I18n.backend.load_translations
      translations = I18n.backend.translations[locale.name]
      translations = Yati::Utils.flat_translation_hash(translations)

      translations.each do |key, value|
        phrase = Yati::Phrase.where(key: key).first_or_create do |record|
          new_keys += 1
        end

        translation = phrase.translations.find_by(locale: locale)

        if translation
          translation.text = value

          next unless translation.changed?

          updated_keys += 1
        else
          translation = phrase.translations.new(locale: locale, text: value)
        end

        translation.save
      end

      if new_keys.zero? && updated_keys.zero?
        puts 'No changes!'
      else
        puts "* Imported #{new_keys} new keys"
        puts "* Updated the text from #{updated_keys} keys"
      end
    end
  end
end
