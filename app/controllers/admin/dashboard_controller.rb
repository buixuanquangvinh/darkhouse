class Admin::DashboardController < AdminController
    def index
        @categories = Category.all
    end
end