class Category < ApplicationRecord
    before_save :to_slug
    has_many :news, :dependent => :destroy
    def to_param
        slug
    end

    private
    def to_slug
        self.slug = name.parameterize.truncate(80, omission: "")
    end
end
