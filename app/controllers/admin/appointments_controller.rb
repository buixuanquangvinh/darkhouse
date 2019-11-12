class Admin::AppointmentsController < AdminController
    def index
        @appointments = Appointment.page params[:page]
    end

    def show
        @appointment = Appointment.find(params[:id])
        @appointment.update(status:'read')
    end
    
    def update
        begin
            @appointment = Appointment.find(params[:id])
            @appointment.update(appointment_params)
            flash[:success] = 'Lưu catalog thành công'
            redirect_to action: :index
        rescue => ex
            flash[:error] = ex.message
            redirect_back fallback_location: root_path
        end
    end

    def appointment_params
        params.require(:appointment).permit(:status)
    end
end