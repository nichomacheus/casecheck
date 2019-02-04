class HospitalsController < ApplicationController
	include HospitalsHelper

	def index
		# if we are given a city parameter filter by this
		if params[:city]
			h = Hospital.where({city: params[:city]})
		# if not get all the hospitals
		else 
			h = Hospital.all
		end
		@hospitals = h
		# respond with json
		send_response(h)
	end

	def show
		# if we got an id, find the hospital by that hospital id
		if params[:id] then r = Hospital.find_by_hospital_id(params[:id])
		# otherwise resppond with error 
		else r = "Please specify an id paramter" end
		send_response(r)
	end

	def create
		# if we got parameters
		if hospital_params
			# convert the id key to hospital id key
			hospital_params[:hospital_id] = hospital_params[:id]
			hospital_params.delete(:id)
			# create the hospital record
			r = Hospital.create(hospital_params)
		# otherwise respond with error
		else r = "Please specify hospital info for add" end 
		send_response(r)
	end

	def update
		# if we got hospital parameters and those parameters include an id tag
		if hospital_params && hospital_params[:id]
			# find the appropriate hospital
			h = Hospital.find_by_hospital_id(hospital_params[:id])
			# perform the update
			h.update_attributes(hospital_params)
			# save && respond with the record
			r = h.save ? "Successfully updated the hospital parameters" : "Update error occured"
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
			h = Hospital.find_by_hospital_id(params[:id])
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
		params.fetch(:hospital, {})
	end

end
