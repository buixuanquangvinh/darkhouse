class Admin::CustomerCommentsController < AdminController
    def index
        @customer_comments = CustomerComment.all
    end

    def new
        @customer_comment = CustomerComment.new
    end

    def create
        begin
            CustomerComment.create!(customer_comment_params)
            flash[:success] = 'Tạo Comment thành công'
            redirect_to action: :index
        rescue => ex
            flash[:error] = ex.message
            redirect_back fallback_location: root_path
        end
    end

    def show
        @customer_comment = CustomerComment.find(params[:id])
    end
    
    def update
        begin
            @customer_comment = CustomerComment.find(params[:id])
            @customer_comment.update(customer_comment_params)
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
            CustomerComment.find(params[:id]).destroy
            flash[:success] = 'Xoá catalog thành công'
            redirect_to action: :index
        rescue => ex
            flash[:error] = ex.message
            redirect_back fallback_location: root_path
        end
    end

    def customer_comment_params
        params.require(:customer_comment).permit(:name,:quote,:image,:image_cache)
    end
end