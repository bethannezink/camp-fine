class Donor < ActiveRecord::Base
  has_many :contributions
  has_many :candidates, through: :contributions

   def self.most_candidates
    self.joins(:candidates).group("donors.id").order("count('candidates.id') DESC").limit(10)
  end
end
