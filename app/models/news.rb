class News < ApplicationRecord
    mount_uploader :image, MediaUploader
    has_many :photos
    accepts_nested_attributes_for :photos
end
