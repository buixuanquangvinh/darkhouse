class News < ApplicationRecord
    mount_uploader :image, MediaUploader
end
