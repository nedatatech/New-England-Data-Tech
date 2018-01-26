class Album < ApplicationRecord
  has_many :albums_images
  has_many :images, through: :albums_images
end
