class IndustryContribution < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :industry
end
