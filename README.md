# README

This is a Rails web app simialr to IMDb. It fetches movie data from omdbapi.com

# SETUP INSTRUCTIONS

1. Go to http://www.omdbapi.com/ and obtain a new API KEY (http://www.omdbapi.com/apikey.aspx)
2. Copy the file .env.example from the repository to .env
3. Edit .env and replace [YOUR-OMDB-API-KEY] with the API KEY you obtained from omdbapi.com
4. Run `bundle install`
   4.1. Run `yarn install --check-files` if you get errors about not locating integrity file
5. Run `rails db:migrate`, development version will run using sqlite3 (make sure you have this installed, should be installed by default on most Mac environments)
6. Run `rails server` (or user `rails server -p PORT` for a different port
7. Navigate to http://localhost:3000 in your browser (or use the port you used above)

# Heroku
The link to the app deployed on Heroku
https://pacific-depths-32072.herokuapp.com/

