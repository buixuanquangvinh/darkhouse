class Admin::NewsController < AdminController
    
    def index
        @news = News.all
    end

    def new
        @news = News.new
        @photos = @news.photos.build
    end

    def create
        begin
            @news = current_user.news_created.create!(news_params)
            if(@news && params[:photos])
                params[:photos]['image'].each do |a|
                    @photo = @news.photos.create!(:image => a)
                end
            end
            flash[:success] = 'Tạo bài đăng thành công'
            redirect_to action: :index
        rescue => ex
            flash[:error] = ex.message
            redirect_back fallback_location: root_path
        end
    end

    def show
        @news = News.find(params[:id])
    end
    
    def update
        begin
            @news = News.find(params[:id])
            @news.update(news_params)
            @news.update(updated_by_id: current_user.id)
            if(@news && params[:photos])
                params[:photos]['image'].each do |a|
                    @photo = @news.photos.create!(:image => a)
                end
            end
            flash[:success] = 'Lưu bài đăng thành công'
            redirect_to action: :index
        rescue => ex
            flash[:error] = ex.message
            redirect_back fallback_location: root_path
        end
    end

    def destroy
        begin
            @news = News.find(params[:id]).destroy
            flash[:success] = 'Xoá bài đăng thành công'
            redirect_to action: :index
        rescue => ex
            flash[:error] = ex.message
            redirect_back fallback_location: root_path
        end
    end

    def news_params
        params.require(:news).permit(
            :title,
            :category_id,
            :sort_content,
            :content,
            :active,
            :highlight,
            :image,
            :image_cache,
            photos_attributes: [:id, :image, :news_id])
    end

end