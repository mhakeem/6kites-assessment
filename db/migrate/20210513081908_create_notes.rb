class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :movie_id, index: true
      t.text :entry, null: false

      t.timestamps
    end
  end
end
