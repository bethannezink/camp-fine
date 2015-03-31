class Candidate < ActiveRecord::Base
  has_many :contributions
  has_many :donors, through: :contributions


  def party_name
    case self.party
    when "D"
      "Democratic Party"
    when "R"
      "Republican Party"
    else
      self.party
    end
  end

  def self.independents
    self.all.collect do |can|
      can if can.party!= "D" && can.party != "R"
    end.flatten
  end


end
