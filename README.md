# CASECHECK Coding Challenge

* This is a Ruby on Rails API

* In order to utilize this API you must have the latest version of Ruby and Rails installed. I recommend using the Ruby Version Manager (RVM) to download Ruby and Rails if you have not done so already. 

* You should create a PostgreSQL database called casecheck_development for development testing of this API. Should you wish to alter the database name or other specifics related to the database do so in the config/database.yml file.

* Once you have created the database, run:

	$ rails db:migrate

* This will instantiate the database tables in the appropraite way. You may then run: 

	$ rails db:seed

* This will seed the database with the provided data. Start a local rails server by running:

	$ rails s

* You can now access the api at http://localhost:3000. The endpoints are included below

* ENDPOINTS: 

	GET /hospitals  -- the collection of hospitals
	GET /hospitals/:id -- see one hospital
	POST /hospitals -- create a new hospital, expects an object of the form {hospital: {-- put hospital object here --}}
	PUT /hospitals/:id -- update a hospital, expects an object of the form {hospital: {-- put new key/value pairs here (this must include the id of the hospital)}}
	DELETE /hospitals/:id -- delete a hospital

	POST /login -- login 
	DELETE /logout -- logout

	GET /users/:id -- get a user 
	POST /users -- create a user
	PUT /users/:id -- update a user
	DELETE /users/:id -- delete a user

	