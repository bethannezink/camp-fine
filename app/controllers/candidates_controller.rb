class CandidatesController < ApplicationController

  def index
    @candidates = Candidate.all
  end

  def show
    @candidate = Candidate.find(params[:id])
    @contributions = @candidate.contributions
    @industry_contributions = @candidate.industry_contributions
  end
end
