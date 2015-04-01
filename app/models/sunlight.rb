class Sunlight


  def candidate_search(search_address)
    dev_key = ENV["sunlight_key"]
    coordinates = Geocoder.coordinates(search_address)
    if coordinates
      latitude = coordinates[0]
      longitude = coordinates[1]
      data = JSON.parse(open("https://congress.api.sunlightfoundation.com/legislators/locate?latitude=#{latitude}&longitude=#{longitude}&apikey=#{dev_key}").read)
    end
  end


  def return_candidate_objects(search_address)
    if candidate_search(search_address)
      candidate_search(search_address)["results"].collect {|candidate| Candidate.find_by(cid: candidate["crp_id"])}.compact
    else
      array = []
    end
  end

end