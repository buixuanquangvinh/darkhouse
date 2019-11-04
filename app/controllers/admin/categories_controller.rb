class Admin::CategoriesController < AdminController
    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def create
        Category.create(category_params)
        redirect_to action: :index
    end

    def show
        @category = Category.find(params[:id])
    end
    
    def update
        @category = Category.find(params[:id])
        @category.update_attributes(category_params)
        redirect_to action: :index
    end

    def destroy
        @category = Category.find(params[:id]).destroy
        redirect_to action: :index
    end

    def category_params
        params.require(:category).permit(:name,:active,:description,:image,:image_cache)
    end
end