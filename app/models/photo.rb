class Photo < ApplicationRecord
    mount_uploader :image, MediaUploader
    belongs_to :news
end
