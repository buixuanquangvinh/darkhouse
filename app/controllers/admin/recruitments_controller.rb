class Admin::RecruitmentsController < AdminController
    def index
        @recruitment = Recruitment.first
        if(!@recruitment)
            @recruitment = Recruitment.new
        end
    end

    def create
        begin
            Recruitment.create(recruitment_params)
            flash[:success] = 'Lưu Thông tin thành công'
            redirect_to action: :index
        rescue
            flash[:error] = ex.message
            redirect_back fallback_location: root_path
        end
    end
    
    def update
        begin
            @recruitment = Recruitment.find(params[:id])
            @recruitment.update(recruitment_params)
            flash[:success] = 'Lưu Thông tin thành công'
            redirect_to action: :index
        rescue
            flash[:error] = ex.message
            redirect_back fallback_location: root_path
        end
    end

    def recruitment_params
        params.require(:recruitment).permit(:content)
    end
end