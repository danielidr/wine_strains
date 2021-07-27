class ApplicationController < ActionController::Base
    def authorize_admin!
        unless current_user.admin?
            flash[:alert] = "You must be an admin in to access this section"
            redirect_to root_path
        end
    end
end
