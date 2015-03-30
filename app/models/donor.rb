class Donor < ActiveRecord::Base
  has_many :contributions
  has_many :candidates, through: :contributions
end
