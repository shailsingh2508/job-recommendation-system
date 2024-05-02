require 'csv'

class Job
  attr_reader :id, :title, :required_skills
  
  def initialize(id, title, required_skills)
    @id = id
    @title = title
    @required_skills = required_skills.split(", ")
  end

  def self.load_from_csv(file_path)
    jobs = []
    CSV.foreach(file_path, headers: true) do |row|
      jobs << Job.new(row['id'], row['title'], row['required_skills'])
    end
    jobs
  end
end
