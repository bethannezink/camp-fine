class SearchController < ApplicationController

  def index
    @candidates = Sunlight.new.return_candidate_objects(params[:q])
    if @candidates.empty?

    else
      @result = Geocoder.address(params[:q])

      render "candidates/index"
    end
  end

  def name
    @candidates = Candidate.where("name LIKE ?", "%#{params[:q]}%")

    @result = params[:q]
    render "candidates/index"
  end


end
