class CustomerComment < ApplicationRecord
    has_paper_trail
    paginates_per 10
    validates :name,:image, presence: {message: "phải điền"}
    mount_uploader :image, MediaUploader

    before_destroy :delete_remote_file, prepend: true
    private def delete_remote_file
        if self.image?
            self.image.file.delete
        end
    end
end
