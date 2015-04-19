class Donor < ActiveRecord::Base
  has_many :contributions
  has_many :candidates, through: :contributions

   def self.most_candidates
    self.joins(:candidates).group("donors.id").order("count('candidates.id') DESC").limit(10)
  end

  def self.most_contributions
    self.group("donors.id").order("count('contributions') DESC").limit(10)
  end
end
