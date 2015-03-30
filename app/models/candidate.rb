class Candidate < ActiveRecord::Base
  has_many :contributions
  has_many :donors, through: :contributions

end
