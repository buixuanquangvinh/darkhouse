class Admin::UsersController < AdminController
    def index
        @users = User.all
    end

    def new
        @user = User.new
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

    def user_params
        params.require(:user).permit(:email,:password,:password_confirmation,:role)
    end
end