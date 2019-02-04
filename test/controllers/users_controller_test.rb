require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@user =  User.create(username: 'Bill', password: 'abcdef', password_confirmation: 'abcdef')
  end

   test "should create user" do 
  	post '/users', params: {user: {
  		username: "Test ", password: 'abcdef', password_confirmation: 'abcdef'
  	}}
  	assert_response :success
  end

  test "should get user" do
    get "/users/"+@user.id.to_s
    assert_response :success
  end

   test "should update user" do 
  	put '/users/'+@user.id.to_s, params: {user: {username: "Sally"}}
  	puts User.find(+@user.id).username 
  	assert_response :success
  end

    test "should delete user" do 
  	delete '/users/'+@user.id.to_s
  	assert_response :success
  end

end
