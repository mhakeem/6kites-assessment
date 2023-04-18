# README

This is a Rails web app to view movies information like IMDb. It fetches movie data from http://www.omdbapi.com

## REQUIREMENTS

- MacOS or Linux
- Ruby 2.7.2
- Node.js 14.x
- Python 2.x (for compiling node's saas package)

## SETUP INSTRUCTIONS

1. Go to http://www.omdbapi.com/ and obtain a new API KEY (http://www.omdbapi.com/apikey.aspx)
2. Copy the file .env.example from the repository to .env
3. Edit .env and replace [YOUR-OMDB-API-KEY] with the API KEY you obtained from omdbapi.com
4. Run `bundle install`

- Run `yarn install --check-files` if you get errors about not locating integrity file

1. Run `rails db:migrate`, development version will run using sqlite3 (make sure you have this installed, should be installed by default on most Mac environments)
2. Run `rails server` (or user `rails server -p PORT` for a different port
3. Navigate to http://localhost:3000 in your browser (or use the port you used above)

## Heroku (Defunct free tier - circa 2022)

~~The link to the app deployed on Heroku
https://pacific-depths-32072.herokuapp.com/~~
