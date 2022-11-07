class AddPlaceToMovieTime < ActiveRecord::Migration[7.0]
  def change
    add_column :movie_times, :place, :string
  end
end
