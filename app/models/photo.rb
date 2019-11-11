class Photo < ApplicationRecord
    mount_uploader :image, MediaUploader
    belongs_to :news, optional: true
    belongs_to :darkhouse_news, optional: true
    before_destroy :delete_remote_file, prepend: true

    private
    def delete_remote_file
        self.image.file.delete
    end

end
