class ApplicationController < ActionController::Base
    before_action :set_constants
    def home
        @news = News.all
    end

    def catalog
        @category = Category.find_by_slug(params[:slug])
        @news = @category.news
    end

    def project
        @news = News.find_by_slug(params[:slug])
    end

    def set_constants
        @categories = Category.all
    end
    
end
