class Admin::NewsController < AdminController
    
    def index
        @news = News.all
    end

    def new
        @news = News.new
        @news.image = params[:file]
    end

    def create
        News.create(news_params)
        redirect_to action: :index
    end

    def show
        @news = News.find(params[:id])
    end
    
    def update
        @news = News.find(params[:id])
        @news.update_attributes(news_params)
        redirect_to action: :index
    end

    def destroy
        @news = News.find(params[:id]).destroy
        redirect_to action: :index
    end

    def news_params
        params.require(:news).permit(:title,:category_id,:sort_content,:content,:active,:image,:image_cache)
    end

end