class Admin::AboutsController < AdminController
    def index
        @about = About.first
        if(!@about)
            @about = About.new
        end
    end

    def create
        begin
            About.create(about_params)
            flash[:success] = 'Lưu Thông tin thành công'
            redirect_to action: :index
        rescue
            flash[:error] = ex.message
            redirect_back fallback_location: root_path
        end
    end
    
    def update
        begin
            @about = About.find(params[:id])
            @about.update(about_params)
            flash[:success] = 'Lưu Thông tin thành công'
            redirect_to action: :index
        rescue
            flash[:error] = ex.message
            redirect_back fallback_location: root_path
        end
    end

    def about_params
        params.require(:about).permit(:content)
    end
end