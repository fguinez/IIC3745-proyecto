class AddAgeAndLanguageToMovie < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :minimum_age, :integer
    add_column :movies, :language, :string
  end
end
