class AlbumsImage < ApplicationRecord
	belongs_to :image, inverse_of: :albums_images
	belongs_to :album, inverse_of: :albums_images

  def create
    byebug
  end 

end
