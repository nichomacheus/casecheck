require 'test_helper'

class HospitalsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should get hospitals index" do
    get '/hospitals'
    assert_response :success
  end

    test "should create hospital" do 
  	post '/hospitals', params: {hospital: {
  		id: 5, name: "Test Hospital", city: 'Chicago', state: 'IL', address: '1 State Street'
  	}}
  	assert_response :success
  end

  test "should get hospital" do
  	  post '/hospitals', params: {hospital: {
  		id: 5, name: "Test Hospital", city: 'Chicago', state: 'IL', address: '1 State Street'
  	}}
    get '/hospitals/5'
    assert_response :success
  end

  test "should delete hospital" do 
  	 post '/hospitals', params: {hospital: {
  		id: 5, name: "Test Hospital", city: 'Chicago', state: 'IL', address: '1 State Street'
  	}}
  	delete '/hospitals/5'
  	assert_response :success
  end

   test "should update hospital" do 
  	 post '/hospitals', params: {hospital: {
  		id: 5, name: "Test Hospital", city: 'Chicago', state: 'IL', address: '1 State Street'
  	}}
  	put '/hospitals/5', params: {hospital: {name: "Other Hospital"}}
  	puts Hospital.find(5).name 
  	assert_response :success
  end



  def setup
  	@hospital = Hospital.new(id: 112, name: "Test Hospital", city: 'Chicago', state: 'IL', address: '1 State Street')
  end

  test 'should_be_valid' do
  	assert @hospital.valid?
  end

end
