class Image < ApplicationRecord
  has_many :albums_images
  has_many :albums, through: :albums_images
  accepts_nested_attributes_for :albums

  mount_uploader :file, PicUploader
end
