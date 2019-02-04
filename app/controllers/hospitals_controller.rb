class HospitalsController < ApplicationController
	# REMEMBER TO FIX THE CSRF TOKEN LATER!!!
	protect_from_forgery with: :null_session	

	include HospitalsHelper

	def index
		# if we are given a city parameter filter by this
		if params[:city]
			# fix the formatting of the input city i.e. downcase it then 
			# capitalize each word
			h = Hospital.where({city: params[:city].upcase})
		# if not get all the hospitals
		else 
			h = Hospital.all
		end
		# respond with json
		send_response(h)
	end

	def show
		# if we got an id, find the hospital by that hospital id
		if params[:id] then r = Hospital.find(params[:id])
		# otherwise resppond with error 
		else r = "Please specify an id paramter" end
		send_response(r)
	end

	def create
		# if we got parameters
		h = !Hospital.find(hospital_params[:id]) rescue true 
		if hospital_params && h
			r = Hospital.create(hospital_params)
			# save
			r.save!
		# otherwise respond with error
		else r = "Error in hospital creation -- this could be due to an attempted submission of a new hospital with the same id" 
		end 
		send_response(r)
	end

	def update
		# if we got hospital parameters and those parameters include an id tag
		if hospital_params && params[:id]
			# find the appropriate hospital
			h = Hospital.find(params[:id])
			if h
				# update
				h.update_attributes(hospital_params)
				# save && respond with the record
				r = h.save ? "Successfully updated the hospital parameters" : "Update error occured"
			else 
				r = "Error, hospital not found"
			end
		else 
			# otherwise throw error
			r = "Please specify update params"
		end
		send_response(r)

	end

	def destroy
		# if we received the id to destroy
		if params[:id]
			# find the record 
			h = Hospital.find(params[:id])
			# if the record exists ....
			if h
				# destroy the record
				h.destroy
				# respond with success
				r = "Successfully deleted the hospital record" 
			else
				# error -- hospital not found
				r = "Hospital not found"
			end
		else
			# error -- no hospital id given
			r = "Please specify a hospital id associatd with the hospital to be deleted"
		end
		send_response(r)
	end

	private

	# only allow certain params 
	def hospital_params
		params.require(:hospital).permit(:name, :city, :address, :state, :id)
	end

end
