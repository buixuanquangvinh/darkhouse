class Admin::CategoriesController < AdminController
    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def create
        begin
            Category.create!(category_params)
            flash[:success] = 'Tạo Catalog thành công'
            redirect_to action: :index
        rescue => ex
            flash[:error] = ex.message
            redirect_back fallback_location: root_path
        end
    end

    def show
        @category = Category.find(params[:id])
    end
    
    def update
        begin
            @category = Category.find(params[:id])
            @category.update_attributes(category_params)
            flash[:success] = 'Lưu catalog thành công'
            redirect_to action: :index
        rescue => ex
            flash[:error] = ex.message
            redirect_back fallback_location: root_path
        end
    end

    def destroy
        begin
            puts params[:id]
            Category.find(params[:id]).destroy
            flash[:success] = 'Xoá catalog thành công'
            redirect_to action: :index
        rescue => ex
            flash[:error] = ex.message
            redirect_back fallback_location: root_path
        end
    end

    def category_params
        params.require(:category).permit(:name,:active,:description,:image,:image_cache)
    end
end