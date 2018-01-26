class CreateJoinTableAlbumImage < ActiveRecord::Migration[5.0]
  def change
    create_join_table :albums, :images do |t|
    	 t.index [:album_id, :image_id]
    end
  end
end
