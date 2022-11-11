# frozen_string_literal: true

class RemoveAgeRestrictionMovie < ActiveRecord::Migration[7.0]
  def change
    # rubocop:disable Rails/ReversibleMigration
    remove_column :movies, :age_restriction
    # rubocop:enable Rails/ReversibleMigration
  end
end
