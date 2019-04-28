# frozen_string_literal: true

class CreateTolkTables < ActiveRecord::Migration[5.2]
  def self.up
    create_table :yati_locales do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_index :yati_locales, :name, unique: true

    create_table :yati_phrases do |t|
      t.text     :key
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :yati_translations do |t|
      t.integer  :phrase_id
      t.integer  :locale_id
      t.text     :text
      t.text     :previous_text
      t.boolean  :primary_updated, default: false
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_index :yati_translations, %i[phrase_id locale_id], unique: true
  end

  def self.down
    remove_index :yati_translations, column: %i[phrase_id locale_id]
    remove_index :yati_locales, column: :name

    drop_table :yati_translations
    drop_table :yati_phrases
    drop_table :yati_locales
  end
end
