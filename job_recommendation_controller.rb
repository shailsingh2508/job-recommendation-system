require_relative '../models/job'
require_relative '../models/jobseeker'

class JobRecommendationController
  def initialize(jobseekers_file, jobs_file)
    @jobseekers = Jobseeker.load_from_csv(jobseekers_file)
    @jobs = Job.load_from_csv(jobs_file)
  end

  def generate_recommendations
    recommendations = []

    @jobseekers.each do |jobseeker|
      @jobs.each do |job|
        matching_skills = (jobseeker.skills & job.required_skills).count
        matching_skill_percent = (matching_skills.to_f / job.required_skills.count * 100).to_i
        recommendations << { jobseeker_id: jobseeker.id.to_i, jobseeker_name: jobseeker.name, job_id: job.id.to_i, job_title: job.title, matching_skill_count: matching_skills.to_i, matching_skill_percent: matching_skill_percent }
      end
    end

    recommendations.sort_by! { |r| [r[:jobseeker_id], -r[:matching_skill_percent], r[:job_id]] }
  end
end
