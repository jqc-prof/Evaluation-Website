class ApplicationController < ActionController::Base
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

    before_action :set_query

    def set_query
        @query = Assignment.ransack(params[:q])
    end


end
