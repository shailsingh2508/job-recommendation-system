require_relative '../controllers/job_recommendation_controller'

class JobRecommendationView
  def initialize(controller)
    @controller = controller
  end

  def display_recommendations
    recommendations = @controller.generate_recommendations
    puts "jobseeker_id, jobseeker_name, job_id, job_title, matching_skill_count, matching_skill_percent"
    recommendations.each do |rec|
      puts "#{rec[:jobseeker_id]}, #{rec[:jobseeker_name]}, #{rec[:job_id]}, #{rec[:job_title]}, #{rec[:matching_skill_count]}, #{rec[:matching_skill_percent]}"
    end
  end
end
