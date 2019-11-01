class Admin::UsersController < AdminController
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        User.create(user_params)
        redirect_to action: :index
    end

    def show
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        puts @user.avatar
        redirect_to action: :index
    end

    def destroy
        @user = User.find(params[:id]).destroy
        redirect_to action: :index
    end

    def user_params
        params.require(:user).permit(:email,:password,:password_confirmation,:role,:avatar)
    end
end