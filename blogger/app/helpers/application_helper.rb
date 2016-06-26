module ApplicationHelper
	def require_login
      unless logged_in?
        redirect_to root_path
        return false
      end
    end
end
