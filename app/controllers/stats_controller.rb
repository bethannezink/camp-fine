class StatsController < ApplicationController

  def index
    @industries = Industry.most_candidates
    @candidates = Candidate.most_cash
    @most_donors = Candidate.most_donors
    @donors = Donor.most_contributions
  end
end
