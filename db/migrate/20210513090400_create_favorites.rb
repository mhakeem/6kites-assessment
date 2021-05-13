class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.string :movie_id, index: true
      t.boolean :faved, default: false

      t.timestamps
    end
  end
end
