class ApplicationController < ActionController::Base
    before_action :set_constants
    def home
        @news = News.all
    end

    def set_constants
        @categories = Category.all
    end
    
end
