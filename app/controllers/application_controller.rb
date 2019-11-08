class ApplicationController < ActionController::Base
    before_action :set_constants

    def home
        @news = News.where(active:true).where(highlight:true).limit(5)
    end

    def contact
    end
    
    def about
        @about = About.first
        if(!@about)
            @about = About.new
        end
    end

    def recruitment
        @recruitment = Recruitment.first
        if(!@recruitment)
            @recruitment = Recruitment.new
        end
    end

    def highlight
        @news = News.where(active:true).where(highlight:true)
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
