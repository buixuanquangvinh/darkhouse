class Category < ApplicationRecord
    mount_uploader :image, MediaUploader
    before_save :to_slug
    has_many :news, :dependent => :destroy

    private
    def to_slug
        self.slug = name.parameterize.truncate(80, omission: "")
    end
end
