
## INSTALLATION

### make sure you have composer 

- ll /usr/bin/composer

- sudo composer -vvv create-project laravel/laravel="8.0.*" mineralexploration

- sudo chown -R marjuqi:marjuqi mineralexploration/

### update composer.json

    "require": {
        "php": "^7.3",
        "fideloper/proxy": "^4.2",
        "fruitcake/laravel-cors": "^2.0",
        "guzzlehttp/guzzle": "^7.0.1",
        "laravel/framework": "^8.0",
        "laravel/tinker": "^2.0",
        "doctrine/dbal": "~2.3",
        "infyomlabs/adminlte-templates": "^2.0",
        "infyomlabs/laravel-generator": "8.0.x-dev",
        "laravel/ui": "^3.2",
        "laravelcollective/html": "^6.2"
    },

- sudo composer -vvv update

### npm stuffs

- npm install

- npm run dev

### scaffold modules using infyom

- php artisan infyom:api_scaffold Hole

		latitude string text

		required

		longitude string text

		required

		dip float text

		required

		azimuth float text

		required

- php artisan infyom:api_scaffold Reading

		hole_id integer:unsigned:foreign,holes,id - `$table->foreign('hole_id')->references('id')->on('holes')` text

		required

		depth float text

		required

		dip float text

		required

		azimuth float text

		required

		is_trustworthy integer text

### create your local DB

### adjust .env file with your local DB config

- php artisan migrate

- php artisan ui bootstrap

- php artisan ui bootstrap --auth

- php artisan ui react

- php artisan make:factory HoleFactory --model=Hole

- php artisan make:factory ReadingFactory --model=Reading

- php artisan db:seed

- php artisan serve --host=__IP_ADDRESS__

### account credential 

goto __IP_ADDRESS__:8000/login, i.e.: http://192.168.69.6:8000/login and use below account ;

	username : marjuqi.rahmat@gmail.com

	password : marjuqi123

or create your own account, goto __IP_ADDRESS__:8000/register, i.e.: http://192.168.69.6:8000/register and then complete the registration from

### WEB URL

	http://__IP_ADDRESS__:8000/home

### API URL 

	http://__IP_ADDRESS__:8000/api/holes
	http://__IP_ADDRESS__:8000/api/holes/2

==========================================================

