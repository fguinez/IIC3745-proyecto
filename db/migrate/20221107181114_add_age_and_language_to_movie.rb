# frozen_string_literal: true

class AddAgeAndLanguageToMovie < ActiveRecord::Migration[7.0]
  def change
    change_table :movies, bulk: true do |t|
      t.column :minimum_age, :integer, null: false
      t.column :language, :string, null: false
    end
  end
end
