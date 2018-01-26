class Gallery < ApplicationRecord
  belongs_to :image
  belongs_to :album
end
