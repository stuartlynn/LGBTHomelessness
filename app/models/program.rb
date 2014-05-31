class Program < ActiveRecord::Base
  belongs_to :organization

  scope :friendliness, ->(rate) {where(friendliness_rating: rate)}
  scope :age_range, -> (start_age,end_age){ where("min_age >= ?", start_age).where( "max_age <= ?", end_age)}

end
