class SearchController < ApplicationController

  def index
    @candidates = Sunlight.new.return_candidate_objects(params[:q])
    if @candidates.empty?
      @result = "No results found. Please try a different search."
    else
      @result = Geocoder.address(params[:q])
    end
    render "candidates/index"

  end

  def name
    @candidates = Candidate.search(:include => [:name]) do
      keywords(params[:q])
    end
    render "candidates/index"
  end

end



# Example:
# class PostsController < ApplicationController
#   def search
#     @search = Post.search(:include => [:comments]) do
#       keywords(params[:q])
#     end
#   end
# end

# @candidates = Candidate.where("name LIKE ?", "%#{params[:q]}%")
# @result = params[:q]
# render "candidates/index"

    
  # end


# end
