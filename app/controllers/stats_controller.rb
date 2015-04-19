class StatsController < ApplicationController

  def index
    @industries = Industry.most_candidates
    @candidates = Candidate.most_cash

  end
end
