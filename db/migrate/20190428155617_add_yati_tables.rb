class AddYatiTables < ActiveRecord::Migration[5.2]
  def self.up
    create_table 'yati_locales', force: true do |t|
      t.string   'name'
      t.datetime 'created_at'
      t.datetime 'updated_at'
    end

    add_index 'yati_locales', ['name'], name: 'index_yati_locales_on_name', unique: true

    create_table 'yati_phrases', force: true do |t|
      t.text     'key'
      t.datetime 'created_at'
      t.datetime 'updated_at'
    end

    add_index 'yati_phrases', ['key'], name: 'index_yati_phrases_on_key', unique: true

    create_table 'yati_translations', force: true do |t|
      t.integer  'phrase_id'
      t.integer  'locale_id'
      t.text     'text'
      t.datetime 'created_at'
      t.datetime 'updated_at'
      t.boolean  'primary_updated', default: false
      t.text     'previous_text'
    end

    add_index 'yati_translations', ['phrase_id', 'locale_id'], name: 'index_yati_translations_on_phrase_id_and_locale_id', unique: true
  end

  def self.down
    drop_table :yati_translations
    drop_table :yati_phrases
    drop_table :yati_locales
  end
end
