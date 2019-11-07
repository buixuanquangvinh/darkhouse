class Admin::UsersController < AdminController
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        begin
            User.create(user_params)
            flash[:success] = 'Tạo người dùng thành công'
            redirect_to action: :index
        rescue => ex
            flash[:error] = ex.message
            redirect_back fallback_location: root_path
        end
    end

    def show
        @user = User.find(params[:id])
    end
    
    def update
        begin
            @user = User.find(params[:id])
            @user.update(user_params)
            puts @user.avatar
            flash[:success] = 'Lưu người dùng thành công'
            redirect_to action: :index
        rescue => ex
            flash[:error] = ex.message
            redirect_back fallback_location: root_path
        end
    end

    def destroy
        begin
            @user = User.find(params[:id]).destroy
            flash[:success] = 'Xoá người dùng thành công'
            redirect_to action: :index
        rescue => ex
            flash[:error] = ex.message
            redirect_back fallback_location: root_path
        end
    end

    def user_params
        params.require(:user).permit(:email,:password,:password_confirmation,:role,:avatar)
    end
end