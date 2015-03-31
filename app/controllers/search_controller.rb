class SearchController < ApplicationController

  def index
    @candidates = Sunlight.new.return_candidate_objects(params[:q])
    if @candidates.empty?
      
    else
      render "candidates/index"
    end
  end


end
