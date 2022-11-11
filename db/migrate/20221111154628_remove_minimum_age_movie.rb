# frozen_string_literal: true

class RemoveMinimumAgeMovie < ActiveRecord::Migration[7.0]
  def change
    # rubocop:disable Rails/ReversibleMigration
    remove_column :movies, :minimum_age
    # rubocop:enable Rails/ReversibleMigration
  end
end
