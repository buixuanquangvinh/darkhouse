class News < ApplicationRecord
    mount_uploader :image, MediaUploader
    has_many :photos, :dependent => :destroy
    belongs_to :category
    belongs_to :created_by_user, :class_name => 'User', foreign_key: :create_by_id
    belongs_to :updated_by_user, :class_name => 'User', foreign_key: :updated_by_id, optional: true
    accepts_nested_attributes_for :photos

    before_save :to_slug
    def to_slug
        self.slug = title.parameterize.truncate(80, omission: "")
    end
    
end
