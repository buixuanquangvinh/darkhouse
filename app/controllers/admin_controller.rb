class AdminController < ActionController::Base
    before_action :authenticate_user!,:notify_number

    def notify_number
        @notify_count = Appointment.where(status: nil).count
    end
end
