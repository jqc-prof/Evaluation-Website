
Background:

A web application would streamline the collection, collation, and analysis of these audience evaluations.


## Usage
1. `git clone git@github.com:cse3901-osu-2022au-910/pg7_final_project.git`

2. `cd pg7_final_project`

3. `bundle install`

4. `rails db:migrate`

5. `rails runner bin/faking.rb`

6. `rails server`

Run `rake db:truncate_all` to clear the database. Step 5 can be repeated to repopulate the database with fake data.

## Features
- A nested forum with Assignments, Submissions to the Assignment, and Ratings for the Submission. 
- Easy navigation provided by navbar as well as buttons throughout the site to go from model to model within the view. 
- Nice styling.
- Scroll up button which will automatically scroll you back to the stop if you click it after having scrolled down.
- Automatic fake data generation
- User permssions different depending on role 'teacher' or 'student'.
- User permissions, such as not being able to self-rate submissions as a student.
- Search bar to search through assignments and allows you to click into the assignment you want to view

