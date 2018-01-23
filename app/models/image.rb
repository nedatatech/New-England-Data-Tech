class Image < ApplicationRecord
mount_uploader :file, PicUploader
end
