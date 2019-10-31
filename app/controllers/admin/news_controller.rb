class Admin::NewsController < AdminController
    
    def index
        @news = News.all
    end

    def new
        @news = News.new
        @photos = @news.photos.build
    end

    def create
        @news = News.create(news_params)
        if(@news && params[:photos])
            params[:photos]['image'].each do |a|
                @photo = @news.photos.create!(:image => a)
            end
        end
        redirect_to action: :index
    end

    def show
        @news = News.find(params[:id])
    end
    
    def update
        @news = News.find(params[:id])
        @news.update_attributes(news_params)
        if(@news && params[:photos])
            params[:photos]['image'].each do |a|
                @photo = @news.photos.create!(:image => a)
            end
        end
        redirect_to action: :index
    end

    def destroy
        @news = News.find(params[:id]).destroy
        redirect_to action: :index
    end

    def news_params
        params.require(:news).permit(
            :title,
            :category_id,
            :sort_content,
            :content,
            :active,
            :image,
            :image_cache,
            photos_attributes: [:id, :image, :news_id])
    end

end