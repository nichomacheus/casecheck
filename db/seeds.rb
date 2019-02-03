# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# grab the list of hospitals
hospitals = JSON.parse(File.read(Rails.root.join('coding-challenge-assets','hospitals.json')))

hospitals.each do |hospital|
	# convert to hash
	h = hospital.to_h 
	# set hospital id == id (records in the db will automatically have an id column)
	h[:hospital_id] = h[:id]
	# delete the id entry
	h.delete(:id)
	# create the record
  	Hospital.create(h)
end