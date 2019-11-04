class ApplicationController < ActionController::Base
    before_action :set_constants
    def home
        @news = News.all
    end

    def contact
    end
    
    def about
    end

    def highlight
    end
    
    def catalog
        @category = Category.find_by_slug(params[:slug])
        @news = @category.news.where(active:true)
    end
    
    def project
        @news = News.find_by_slug(params[:slug])
    end

    def set_constants
        @categories = Category.where(active:true)
    end
    
end
