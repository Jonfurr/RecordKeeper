class RemoveUserIdFromAlbums < ActiveRecord::Migration
  def change
    remove_column :albums, :user_id, :integer
  end
end
