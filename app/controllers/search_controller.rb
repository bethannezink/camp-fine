class SearchController < ApplicationController

  def index

    @candidates = Sunlight.new.return_candidate_objects(params[:q])
    render "candidates/index"
  end


end
