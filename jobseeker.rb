require 'csv'

class Jobseeker
  attr_reader :id, :name, :skills
  
  def initialize(id, name, skills)
    @id = id
    @name = name
    @skills = skills.split(", ")
  end

  def self.load_from_csv(file_path)
    jobseekers = []
    CSV.foreach(file_path, headers: true) do |row|
      jobseekers << Jobseeker.new(row['id'], row['name'], row['skills'])
    end
    jobseekers
  end
end
