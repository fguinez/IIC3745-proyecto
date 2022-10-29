# frozen_string_literal: true

class AddNameToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :name, :string
  end
end
