class OpenSecret

  def dev_key
    dev_key = ENV["open_secret_key"]
  end

  def fetch_candidates(state)
    JSON.parse(open("http://www.opensecrets.org/api/?method=getLegislators&id=#{state}&apikey=#{dev_key}&output=json").read)
  end

  def fetch_contributions(candidate_cid)
    JSON.parse(open("http://www.opensecrets.org/api/?method=candContrib&cid=#{candidate_cid}&cycle=2012&apikey=#{dev_key}&output=json").read)
  end

  def build_candidates(state)
    data = fetch_candidates(state)
    data["response"]["legislator"].each do |candidate_hash|
      candidate = Candidate.new
      candidate.name = candidate_hash["@attributes"]["firstlast"]
      candidate.state = state
      candidate.party = candidate_hash["@attributes"]["party"]
      candidate.first_elected = candidate_hash["@attributes"]["first_elected"]
      candidate.cid = candidate_hash["@attributes"]["cid"]
      candidate.save
    end
  end

  def update_candidates
    Candidate.all.each do |candidate|
      data = JSON.parse(open("http://www.opensecrets.org/api/?method=candSummary&cid=#{candidate.cid}&cycle=2012&apikey=#{dev_key}&output=json").read)
      info = data["response"]["summary"]["@attributes"]
      candidate.chamber = info["chamber"]
      candidate.total = info["total"]
      candidate.spent = info["spent"]
      candidate.cash_on_hand = info["cash_on_hand"]
      candidate.debt = candidate["debt"]
      candidate.save
    end

  def build_contributions

  end




end
