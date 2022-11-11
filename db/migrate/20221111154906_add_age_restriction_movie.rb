# frozen_string_literal: true

class AddAgeRestrictionMovie < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :age_restriction, :boolean
  end
end
