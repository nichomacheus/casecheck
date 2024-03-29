module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end


  def current_user?(user)
    user == current_user
  end

  def current_user(id)
  	@current_user = id
  end

  def logged_in?
   !current_user.nil?
 end

 def log_out
   session.delete(:user_id)
   @current_user = nil
 end

 def log_out
   session.delete(:user_id)
   @current_user = nil
 end
end