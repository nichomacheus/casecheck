module HospitalsHelper
	
	def send_response(response)
		puts "****************"
		puts response
		puts "****************"
		respond_to do |format|
			format.json { render :json => response}
		end
	end

end
