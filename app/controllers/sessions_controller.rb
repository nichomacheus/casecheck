class SessionsController < ApplicationController
	include HospitalsHelper


  def create
    user = User.find_by(username: params[:username].upcase)
    if user && user.authenticate(params[:session][:password])
        log_in user
        r = user
    else
      r = 'Invalid email/password combination'
    end
    send_response(r)
  end

  def destroy
    log_out if logged_in?
  end
end