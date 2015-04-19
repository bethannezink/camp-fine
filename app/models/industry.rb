class Industry < ActiveRecord::Base
  has_many :industry_contributions
  has_many :candidates, through: :industry_contributions

  def self.most_candidates
    self.joins(:candidates).group("industries.id").order("count('candidates.id') DESC").limit(10)
  end

end