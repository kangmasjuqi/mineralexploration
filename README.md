## Intro

### Background

Survey instruments are used by mineral exploration clients to measure the physical location of a drilled
hole and see how close the actual end of the hole is to the planned underground target mineral body.
You need to provide a way for geologists to view the following readings coming from a survey
instrument:

- A single collar position (latitude, longitude, dip and azimuth) which is the surface position and orientation
of the drill hole.

- A number of depth readings. Each reading has depth, dip and azimuth providing the direction of the hole
at that point.

### The Challenge

Develop a web app using HTML, CSS, JavaScript (preferably ReactJS), and any back-end framework
(preferably PHP Laravel) that allows a user to perform the following:

- Select an existing drill hole from a list.
- View the collar position and depth readings for that drill hole.
- Override any depth reading as being incorrect or not.

## Application SETUP

### Source Code Retrieval

- Repo : https://github.com/kangmasjuqi/mineralexploration

- Branch : laravel-with-react-separated-folder

- ZIP version : .......???

### DB setup

- Import the "mineralexploration_db.sql" into your local DB

### Backend setup

- First of all, adjust your config on .ENV file for below items:

		DB_CONNECTION=
		DB_HOST=
		DB_PORT=
		DB_DATABASE=
		DB_USERNAME=
		DB_PASSWORD=

- Dependencies setup 

		cd backend
		composer install
		npm install

- Run the Laravel App 

		php artisan serve --host=_____YOUR_IP_ADDRESS_____

### Frontend setup

- First of all, adjust `API_URL` on /frontend/src/Config.json file to point to your local API

- Dependencies setup 

		cd frontend
		npm install

- Run the React App 

		npm start

### Demo

Below is the link to the DEMO of the app on Marjuqi-Local-Machine

	https://www.loom.com/share/1cc1366b1e914f3c88c66c78b0223245

https://www.loom.com/share/1cc1366b1e914f3c88c66c78b0223245

### Marjuqi-Machine-Snapshot

As a reference, I attached my local machine data to give a snapshot about my local machine configuration

	MARJUQI-MACHINE-SNAPSHOT.TXT

## Contact

	marjuqi[dot]rahmat[at]gmail