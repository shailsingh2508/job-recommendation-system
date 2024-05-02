## Overview:

This application is a job match recommendation engine implemented in Ruby using the MVC (Model-View-Controller) architecture. It reads jobseekers' skills and job requirements from CSV files, calculates matching skills between them, and generates job recommendations based on the matches.

## Usage: 

To run the application, execute the main.rb file:

ruby main.rb


## Components:
Model

Job and Jobseeker classes represent jobs and jobseekers, respectively. They handle loading data from CSV files and provide methods to access attributes like ID, title, and skills.
   
View

JobRecommendationView handles the presentation of the results. It receives a JobRecommendationController object, generates job recommendations using the controller, and displays them in the console.
   
Controller

JobRecommendationController processes the data and performs the matching algorithm. It loads jobseekers and jobs from CSV files, calculates matching skills between them, and sorts the recommendations based on specific criteria.    

Data

CSV files (jobseekers.csv and jobs.csv) contain information about jobseekers and jobs, respectively.

Tests

  The tests directory contains test cases for controller component of the application. Tests are written using Rspec.

  To run the tests, 

  1. navigate to tests directory
  2. Execute:
      rspec job_recommendation_controller_spec.rb


## Example Output:

jobseeker_id, jobseeker_name, job_id, job_title, matching_skill_count, matching_skill_percent
1, Alice Seeker, 1, Ruby Developer, 3, 100.0
1, Alice Seeker, 3, Backend Developer, 2, 50.0
1, Alice Seeker, 9, Python Developer, 2, 50.0
1, Alice Seeker, 4, Fullstack Developer, 2, 33.0
1, Alice Seeker, 7, Data Analyst, 1, 25.0
1, Alice Seeker, 8, Web Developer, 1, 25.0
1, Alice Seeker, 2, Frontend Developer, 0, 0.0
1, Alice Seeker, 5, Machine Learning Engineer, 0, 0.0
1, Alice Seeker, 6, Cloud Architect, 0, 0.0
1, Alice Seeker, 10, JavaScript Developer, 0, 0.0
2, Bob Applicant, 2, Frontend Developer, 3, 75.0
2, Bob Applicant, 8, Web Developer, 3, 75.0
2, Bob Applicant, 4, Fullstack Developer, 2, 33.0
2, Bob Applicant, 10, JavaScript Developer, 1, 25.0

## Additional information

To run this application you need to have these libraries installed:

csv: To parse csv files
Rspec: To run testcases
Faker: To run testcases with fake data

   
