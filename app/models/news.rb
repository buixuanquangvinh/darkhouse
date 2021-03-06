class News < ApplicationRecord
    has_paper_trail
    paginates_per 10
    validates :title,:image, presence: {message: "phải điền"}
    mount_uploader :image, MediaUploader
    has_many :photos, :dependent => :destroy
    belongs_to :category
    belongs_to :created_by_user, :class_name => 'User', foreign_key: :create_by_id
    belongs_to :updated_by_user, :class_name => 'User', foreign_key: :updated_by_id, optional: true
    accepts_nested_attributes_for :photos

    before_save :to_slug
    private def to_slug
        self.slug = title.parameterize.truncate(80, omission: "")
    end
    
    before_destroy :delete_remote_file, prepend: true
    private def delete_remote_file
        if self.image?
            self.image.file.delete
        end
    end
end
