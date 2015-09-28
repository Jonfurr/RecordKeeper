class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :artist
      t.integer :year
      t.string :title
      t.string :pressing
      t.string :label
      t.string :genre
      t.text :image
      t.string :tracklist
      t.string :country
      t.text :comment
      t.boolean :favorite

      t.timestamps null: false
    end
  end
end
