class Admin::DarkhouseNewsController < AdminController
    
    def index
        @darkhouse_news = DarkhouseNews.all
    end

    def new
        @darkhouse_news = DarkhouseNews.new
        @photos = @darkhouse_news.photos.build
    end

    def create
        begin
            @darkhouse_news = current_user.darkhouse_news_created.create!(darkhouse_news_params)
            if(@darkhouse_news && params[:photos])
                params[:photos]['image'].each do |a|
                    @photo = @darkhouse_news.photos.create!(:image => a)
                end
            end
            flash[:success] = 'Tạo tin tức thành công'
            redirect_to action: :index
        rescue => ex
            flash[:error] = ex.message
            redirect_back fallback_location: root_path
        end
    end

    def show
        @darkhouse_news = DarkhouseNews.find(params[:id])
    end
    
    def update
        begin
            @darkhouse_news = DarkhouseNews.find(params[:id])
            @darkhouse_news.update(darkhouse_news_params)
            @darkhouse_news.update(updated_by_id: current_user.id)
            if(@darkhouse_news && params[:photos])
                params[:photos]['image'].each do |a|
                    @photo = @darkhouse_news.photos.create!(:image => a)
                end
            end
            flash[:success] = 'Lưu tin tức thành công'
            redirect_to action: :index
        rescue => ex
            flash[:error] = ex.message
            redirect_back fallback_location: root_path
        end
    end

    def destroy
        begin
            @darkhouse_news = DarkhouseNews.find(params[:id]).destroy
            flash[:success] = 'Xoá tin tức thành công'
            redirect_to action: :index
        rescue => ex
            flash[:error] = ex.message
            redirect_back fallback_location: root_path
        end
    end

    def darkhouse_news_params
        params.require(:darkhouse_news).permit(
            :title,
            :sort_content,
            :content,
            :active,
            :highlight,
            :image,
            :image_cache,
            photos_attributes: [:id, :image, :darkhouse_news_id])
    end

end