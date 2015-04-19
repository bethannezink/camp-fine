class StatsController < ApplicationController

  def index
    @candidates = Candidate.most_cash
  end
end
