class Program < ActiveRecord::Base
  belongs_to :organization

  scope :friendliness, ->(rate) {where(friendliness_rating: rate)}
  scope :age_range, -> (start_age,end_age){ where("min_age >= ?", start_age).where( "max_age <= ?", end_age)}
  scope :gender_req, ->(gender){where(gender_req: gender)}
  scope :health_status_req, ->(status){where(health_status_req: status)}
  scope :language_req, ->(language){where(language_req: language)}
  scope :services, ->(request){where("services like ?", request)}
end
