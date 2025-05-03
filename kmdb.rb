# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all




# Generate models and tables, according to the domain model.
# TODO!
#Refer to respective create_things.rb file in db/migrate
#rails generate model Studio
#rails db:migrate
#rails generate model Movie
#rails db:migrate
#rails generate model Actor
#rails db:migrate
#rails generate model Role
#rails db:migrate



# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!
new_studio = Studio.new
#p new_studio

#Insert studio data
new_studio["name"]="Warner Bros."
new_studio.save
#p new_studio

warner_bros= Studio.find_by({"name"=>"Warner Bros."})
#p warner_bros

# Insert movie data
new_movie=Movie.new
new_movie["title"]="Batman Begins"
new_movie["year_released"]=2005
new_movie["rated"]="PG-13"
new_movie["studio_id"]=warner_bros["id"]
new_movie.save
#p new_movie

new_movie=Movie.new
new_movie["title"]="The Dark Knight"
new_movie["year_released"]=2008
new_movie["rated"]="PG-13"
new_movie["studio_id"]=warner_bros["id"]
new_movie.save
#p new_movie

new_movie=Movie.new
new_movie["title"]="The Dark Knight Rises"
new_movie["year_released"]=2012
new_movie["rated"]="PG-13"
new_movie["studio_id"]=warner_bros["id"]
new_movie.save
#p new_movie

batman_begins_movie=Movie.find_by({"title"=>"Batman Begins"})
#p batman_begins_movie

the_dark_knight_movie=Movie.find_by({"title"=>"The Dark Knight"})
#p the_dark_knight_movie

the_dark_knight_rises_movie=Movie.find_by({"title"=>"The Dark Knight Rises"})
#p the_dark_knight_rises_movie

#Batman Begins
#Insert actor data
new_actor=Actor.new
new_actor["name"]="Christian Bale"
new_actor.save
#p new_actor

christian_bale_actor=Actor.find_by({"name"=>"Christian Bale"})
#p christian_bale_actor

new_actor=Actor.new
new_actor["name"]="Michael Caine"
new_actor.save
#p new_actor

michael_caine_actor=Actor.find_by({"name"=>"Michael Caine"})

new_actor=Actor.new
new_actor["name"]="Liam Neeson"
new_actor.save
#p new_actor

liam_neeson_actor=Actor.find_by({"name"=>"Liam Neeson"})


new_actor=Actor.new
new_actor["name"]="Katie Holmes"
new_actor.save
#p new_actor

katie_holmes_actor=Actor.find_by({"name"=>"Katie Holmes"})

new_actor=Actor.new
new_actor["name"]="Gary Oldman"
new_actor.save
#p new_actor

gary_oldman_actor=Actor.find_by({"name"=>"Gary Oldman"})


#Insert role data
new_role=Role.new
new_role["movie_id"]=batman_begins_movie["id"]
new_role["actor_id"]=christian_bale_actor["id"]
new_role["character_name"]="Bruce Wayne"
new_role.save
#p new_role

new_role=Role.new
new_role["movie_id"]=batman_begins_movie["id"]
new_role["actor_id"]=michael_caine_actor["id"]
new_role["character_name"]="Alfred"
new_role.save
#p new_role

new_role=Role.new
new_role["movie_id"]=batman_begins_movie["id"]
new_role["actor_id"]=liam_neeson_actor["id"]
new_role["character_name"]="Ra's Al Ghul"
new_role.save
#p new_role

new_role=Role.new
new_role["movie_id"]=batman_begins_movie["id"]
new_role["actor_id"]=katie_holmes_actor["id"]
new_role["character_name"]="Rachel Dawes"
new_role.save
#p new_role

new_role=Role.new
new_role["movie_id"]=batman_begins_movie["id"]
new_role["actor_id"]=gary_oldman_actor["id"]
new_role["character_name"]="Commissioner Gordon"
new_role.save
#p new_role

#The Dark Knight 
#Insert Actor Data

#Insert actor data
new_actor=Actor.new
new_actor["name"]="Heath Ledger"
new_actor.save
#p new_actor

heath_ledger_actor=Actor.find_by({"name"=>"Heath Ledger"})

new_actor=Actor.new
new_actor["name"]="Aaron Eckhart"
new_actor.save
#p new_actor

aaron_eckhart_actor=Actor.find_by({"name"=>"Aaron Eckhart"})

new_actor=Actor.new
new_actor["name"]="Maggie Gyllenhaal"
new_actor.save
#p new_actor

maggie_gyllenhaal_actor=Actor.find_by({"name"=>"Maggie Gyllenhaal"})

#Insert role data
new_role=Role.new
new_role["movie_id"]=the_dark_knight_movie["id"]
new_role["actor_id"]=christian_bale_actor["id"]
new_role["character_name"]="Bruce Wayne"
new_role.save
#p new_role

new_role=Role.new
new_role["movie_id"]=the_dark_knight_movie["id"]
new_role["actor_id"]=heath_ledger_actor["id"]
new_role["character_name"]="Joker"
new_role.save
#p new_role

new_role=Role.new
new_role["movie_id"]=the_dark_knight_movie["id"]
new_role["actor_id"]=aaron_eckhart_actor["id"]
new_role["character_name"]="Harvey Dent"
new_role.save
#p new_role 

new_role=Role.new
new_role["movie_id"]=the_dark_knight_movie["id"]
new_role["actor_id"]=michael_caine_actor["id"]
new_role["character_name"]="Alfred"
new_role.save
#p new_role 

new_role=Role.new
new_role["movie_id"]=the_dark_knight_movie["id"]
new_role["actor_id"]=maggie_gyllenhaal_actor["id"]
new_role["character_name"]="Rachel Dawes"
new_role.save
#p new_role 

#The Dark Knight Rises 
#Insert Actor Data

#Insert actor data
new_actor=Actor.new
new_actor["name"]="Tom Hardy"
new_actor.save
#p new_actor

tom_hardy_actor=Actor.find_by({"name"=>"Tom Hardy"})

new_actor=Actor.new
new_actor["name"]="Joseph Gordon-Levitt"
new_actor.save
#p new_actor

joseph_gordon_levitt_actor=Actor.find_by({"name"=>"Joseph Gordon-Levitt"})

new_actor=Actor.new
new_actor["name"]="Anne Hathaway"
new_actor.save
#p new_actor

anne_hathaway_actor=Actor.find_by({"name"=>"Anne Hathaway"}) 


#Insert roles
new_role=Role.new
new_role["movie_id"]=the_dark_knight_rises_movie["id"]
new_role["actor_id"]=christian_bale_actor["id"]
new_role["character_name"]="Bruce Wayne"
new_role.save
#p new_role 

new_role=Role.new
new_role["movie_id"]=the_dark_knight_rises_movie["id"]
new_role["actor_id"]=gary_oldman_actor["id"]
new_role["character_name"]="Commissioner Gordon"
new_role.save
#p new_role 


new_role=Role.new
new_role["movie_id"]=the_dark_knight_rises_movie["id"]
new_role["actor_id"]=tom_hardy_actor["id"]
new_role["character_name"]="Bane"
new_role.save
#p new_role 


new_role=Role.new
new_role["movie_id"]=the_dark_knight_rises_movie["id"]
new_role["actor_id"]=joseph_gordon_levitt_actor["id"]
new_role["character_name"]="John Blake"
new_role.save
#p new_role 


new_role=Role.new
new_role["movie_id"]=the_dark_knight_rises_movie["id"]
new_role["actor_id"]=anne_hathaway_actor["id"]
new_role["character_name"]="Selina Kyle"
new_role.save
#p new_role 




# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

for movie in Movie.all
    studio=Studio.find_by({"id"=>movie["studio_id"]})
    p "#{movie["title"]} #{movie["year_released"]} #{movie["rated"]} #{studio["name"]}"
end



# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

for role in Role.all
    movie=Movie.find_by({"id"=>role["movie_id"]})
    actor=Actor.find_by({"id"=>role["actor_id"]})
    p "#{movie["title"]} #{actor["name"]} #{role["character_name"]}"
end

