class Category < ApplicationRecord
    has_paper_trail
    paginates_per 10
    validates :name,:image, presence: {message: "phải điền"}
    mount_uploader :image, MediaUploader
    has_many :news, :dependent => :destroy

    before_save :to_slug
    private def to_slug
        self.slug = name.parameterize.truncate(80, omission: "")
    end

    before_destroy :delete_remote_file, prepend: true
    private def delete_remote_file
        if self.image?
            self.image.file.delete
        end
    end

end
