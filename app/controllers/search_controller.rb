class SearchController < ApplicationController

  def index
    binding.pry
    @candidates = Candidate.find_by(zip_code: params[:q])
    if @candidates.empty?
      #hit the api
      # for each result, update the zip code property of the candidates
      #return the results of the updated objects
    else
      @candidates
    end
  end


end
