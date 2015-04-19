class Candidate < ActiveRecord::Base
  has_many :contributions
  has_many :donors, through: :contributions
  has_many :industry_contributions
  has_many :industries, through: :industry_contributions
  fuzzily_searchable :name

  def party_name
    case self.party
    when "D"
      "Democratic"
    when "R"
      "Republican"
    else
      self.party
    end
  end

  def position
    case self.chamber
    when "H"
      "Representative"
    when "S"
      "Senator"
    else
      self.chamber
    end
  end

  def self.independents
    self.all.collect do |can|
      can if can.party!= "D" && can.party != "R"
    end.flatten
  end

  def self.most_cash
    self.group(:id).order("cash_on_hand DESC").limit(10)
  end

  def self.most_donors
    self.group('candidates.name').order("count('donors.id') DESC").limit(10)
  end


end
