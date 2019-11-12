class ApplicationController < ActionController::Base
    before_action :set_constants

    def home
        @customer_comments = CustomerComment.limit(5)
        @darkhouse_news = DarkhouseNews.limit(6)
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
    end
    
    def catalog
        @category = Category.find_by_slug(params[:slug])
        @news = @category.news.where(active:true).page params[:page]
    end
    
    def project
        @news = News.find_by_slug(params[:slug])
    end

    def darkhouse_news
        @darkhouse_news = DarkhouseNews.page params[:page]
    end

    def darkhouse_news_detail
        @darkhouse_news = DarkhouseNews.find_by_slug(params[:slug])
    end

    def set_constants
        @categories = Category.where(active:true)
    end

end
