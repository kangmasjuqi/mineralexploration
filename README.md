## Background & The Challenge

	Survey instruments are used by mineral exploration clients to measure the physical location of a drilled
	hole and see how close the actual end of the hole is to the planned underground target mineral body.
	You need to provide a way for geologists to view the following readings coming from a survey
	instrument:
	• A single collar position (latitude, longitude, dip and azimuth) which is the surface position and orientation
	of the drill hole.
	• A number of depth readings. Each reading has depth, dip and azimuth providing the direction of the hole
	at that point.

	Develop a web app using HTML, CSS, JavaScript (preferably ReactJS), and any back-end framework
	(preferably PHP Laravel) that allows a user to perform the following:
	• Select an existing drill hole from a list.
	• View the collar position and depth readings for that drill hole.
	• Override any depth reading as being incorrect or not.

## Application SETUP

### Source Code Retrieval

	Repo : https://github.com/kangmasjuqi/mineralexploration
	Branch : laravel-with-react-separated-folder

### DB setup

	import the "mineralexploration_db.sql" into your local DB

### Backend setup

	cd backend
	composer install
	npm install
	php artisan serve --host=_____YOUR_IP_ADDRESS_____

	configure your DB config on .ENV file for below data:

		DB_CONNECTION=
		DB_HOST=
		DB_PORT=
		DB_DATABASE=
		DB_USERNAME=
		DB_PASSWORD=

### Frontend setup

	cd frontend
	npm install
	npm start

	configure Config.js content to point to your local API URL???

### Demo

	link to LOOM???

### Marjuqi-Machine-Snapshot as a Reference

	MARJUQI-MACHINE-SNAPSHOT.TXT


## Contact

	marjuqi[.]rahmat[at]gmail