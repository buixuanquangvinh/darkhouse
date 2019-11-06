class Admin::AboutsController < AdminController
    def index
        @about = About.first
        if(!@about)
            @about = About.new
        end
    end

    def create
        About.create(about_params)
        redirect_to action: :index
    end
    
    def update
        @about = About.find(params[:id])
        @about.update(about_params)
        redirect_to action: :index
    end

    def about_params
        params.require(:about).permit(:content)
    end
end