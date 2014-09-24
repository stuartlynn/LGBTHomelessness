class Program < ActiveRecord::Base
  belongs_to :organization
  has_many :locations

  scope :friendliness, ->(rate) {where("friendliness_rating = ? OR friendliness_rating IS NULL", rate)}
  scope :age_range, -> (age){ where("min_age <= ? OR min_age IS null OR min_age = 0", age).where( "max_age >= ? OR max_age IS null OR max_age = 0", age)}
  scope :sexual_orientation_required, ->(orientation){where("sexual_orientation_requirement = ? OR sexual_orientation_requirement = '' OR sexual_orientation_requirement IS null ", orientation)}
  scope :gender_required, ->(gender){where("gender_req like ? OR gender_req = '' or gender_req IS null", gender)}
  # scope :health_req, ->(status){where(health_status_req: status)}
  scope :language_needed, ->(language){where("language_req like ? or language_req IS null", language)}
  scope :services_offered, ->(request){where("services like ?", request)}

  def self.service_query(query, service_array)
    output=[]
    query.each do |program|
      service_array.each do |service|
        if program.services.include?(service)
          output << program
        end
      end
    end
    output
  end


end
