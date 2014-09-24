class Organization < ActiveRecord::Base
  has_many :programs
  has_many :locations

  def friendliness_ratings
    programs.collect{|p| p.friendliness_rating}.uniq
  end
    
  def get_services
    programs.each_with_object([]) {|prog, arr| arr << prog.services }.uniq.join(" ")
  end

  def self.locations
    loc = pluck(:city).zip(pluck(:state)).uniq
    loc.map {|upd| upd unless upd.include?("") || upd.include?(nil) }.compact
  end
end
