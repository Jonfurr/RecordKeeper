class RemoveForeignKeyFromAlbums < ActiveRecord::Migration
  def change
    remove_column :albums, :foreignkey, :integer
  end
end
