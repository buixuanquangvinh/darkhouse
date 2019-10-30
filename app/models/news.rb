class News < ApplicationRecord
    mount_uploader :image, MediaUploader
    has_many :photos
    belongs_to :category
    accepts_nested_attributes_for :photos
    before_save :to_slug

    private
    def to_slug
        self.slug = title.parameterize.truncate(80, omission: "")
    end
end
