class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
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

    def upload_image
        @photo = Photo.new
        @photo.news_id = params[:news_id]
        @photo.image = params[:upload]
        @photo.save!
        @re_photo = Photo.find(@photo.id)
        msg = { 
            :uploaded => 1, 
            :url => @re_photo.image.url
        }
        render :json => msg.to_json
    end

    def set_constants
        @categories = Category.where(active:true)
    end

end
