class AddForeignkeyToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :foreignkey, :integer
  end
end
