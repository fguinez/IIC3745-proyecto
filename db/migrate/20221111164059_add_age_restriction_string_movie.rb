# frozen_string_literal: true

class AddAgeRestrictionStringMovie < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :age_restriction, :string
  end
end
