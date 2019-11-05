class Category < ApplicationRecord
    mount_uploader :image, MediaUploader
    has_many :news, :dependent => :destroy

    before_save :to_slug
    private def to_slug
        self.slug = name.parameterize.truncate(80, omission: "")
    end

    before_destroy :delete_remote_file, prepend: true
    private def delete_remote_file
        self.image.file.delete
    end

end
