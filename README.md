# README

This README would normally document whatever steps are necessary to get the
application up and running.

# SETUP INSTRUCTIONS

1. Go to http://www.omdbapi.com/ and obtain a new API KEY (http://www.omdbapi.com/apikey.aspx)
2. Copy the file .env.example from the repository to .env
3. Edit .env and replace [YOUR-OMDB-API-KEY] with the API KEY you obtained from omdbapi.com
3. Run bundle install
4. Run rake db:migrate, development version will run using sqlite3 (make sure you have this installed, should be installed by default on most Mac environments)
5. Run ```rails server``` (or user ```rails server -p PORT``` for a different port
6. Navigate to http://localhost:3000 in your browser (use the port you used above)

