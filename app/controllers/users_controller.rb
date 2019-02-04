class UsersController < ApplicationController

  def show
  	# return the user
    user = User.find(params[:id])
    send_response(user)
  end

  def create
  	# create a user
    user = User.create(user_params)
    if user.save then r = user 
    else r = "Error creating user" end
    	send_response(r)
  end

  def update
  	# update a user
    user = User.find(params[:id])
    user.update_attributes(user_params)
  end


  def destroy
  	# delete a user
    user = User.find(params[:id])
    if user then user.destroy else r = "Error deleting user"
    send_response(r ? r : "User successfully deleted!")
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
