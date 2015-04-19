class Contribution < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :donor

 
end
