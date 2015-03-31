class Industry < ActiveRecord::Base
  has_many :industry_contributions
  has_many :candidates, through: :industry_contributions
end
