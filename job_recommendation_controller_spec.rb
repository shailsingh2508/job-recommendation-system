require 'faker'
require_relative '../controllers/job_recommendation_controller'

describe JobRecommendationController do
  describe '#generate_recommendations' do
  let(:jobseekers) do
    5.times.map { |n| Jobseeker.new(n + 1, Faker::Name.name, Faker::Lorem.words(number: rand(1..5)).join(', ')) }
  end

  let(:jobs) do
    5.times.map { |n| Job.new(n + 1, Faker::Job.title, Faker::Lorem.words(number: 5).join(', ')) }
  end

    before do
      allow(Jobseeker).to receive(:load_from_csv).and_return(jobseekers)
      allow(Job).to receive(:load_from_csv).and_return(jobs)
    end

   it 'generates recommendations with correct structure' do
      controller = JobRecommendationController.new(nil, nil)
      recommendations = controller.generate_recommendations

      recommendations.each do |recommendation|
        puts recommendation
        expect(recommendation).to have_key(:jobseeker_id)
        expect(recommendation).to have_key(:jobseeker_name)
        expect(recommendation).to have_key(:job_id)
        expect(recommendation).to have_key(:job_title)
        expect(recommendation).to have_key(:matching_skill_count)
        expect(recommendation).to have_key(:matching_skill_percent)
      end
    end

    it 'generates recommendations for each jobseeker' do
      controller = JobRecommendationController.new(nil, nil)
      recommendations = controller.generate_recommendations

      jobseeker_ids = recommendations.map { |rec| rec[:jobseeker_id] }.uniq
      expect(jobseeker_ids).to eq(jobseekers.map(&:id))
    end

    it 'generates recommendations for each job' do
      controller = JobRecommendationController.new(nil, nil)
      recommendations = controller.generate_recommendations

      job_ids = recommendations.map { |rec| rec[:job_id] }.uniq
      expect(job_ids).to eq(jobs.map(&:id))
    end

    it 'generates recommendations with matching skill count and percent' do
      controller = JobRecommendationController.new(nil, nil)
      recommendations = controller.generate_recommendations

      recommendations.each do |recommendation|
        job = jobs.find { |j| j.id == recommendation[:job_id] }
        jobseeker = jobseekers.find { |js| js.id == recommendation[:jobseeker_id] }
        matching_skills = (jobseeker.skills & job.required_skills).count
        matching_skill_percent = (matching_skills.to_f / job.required_skills.count * 100).to_i

        expect(recommendation[:matching_skill_count]).to eq(matching_skills)
        expect(recommendation[:matching_skill_percent]).to eq(matching_skill_percent)
      end
    end
  end
end
