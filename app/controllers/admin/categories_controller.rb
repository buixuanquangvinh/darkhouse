class Admin::CategoriesController < AdminController
    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def create
        Category.create(category_params)
    end

    def category_params
        params.require(:category).permit(:name,:active)
    end
end