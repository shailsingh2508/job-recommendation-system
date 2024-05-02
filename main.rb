require_relative 'controllers/job_recommendation_controller'
require_relative 'views/job_recommendation_view'

jobseekers_file = 'data/jobseekers.csv'
jobs_file = 'data/jobs.csv'

controller = JobRecommendationController.new(jobseekers_file, jobs_file)
view = JobRecommendationView.new(controller)
view.display_recommendations
