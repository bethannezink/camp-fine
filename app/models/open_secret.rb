class OpenSecret

  def dev_key
    dev_key = ENV["open_secret_key"]
  end

  def fetch_candidates(state)
    JSON.parse(open("http://www.opensecrets.org/api/?method=getLegislators&id=#{state}&apikey=#{dev_key}&output=json").read)
  end

  def fetch_contributions(candidate_cid)
    JSON.parse(open("http://www.opensecrets.org/api/?method=candContrib&cid=#{candidate_cid}&cycle=2014&apikey=#{dev_key}&output=json").read)
  end

  def fetch_industry_contributions(candidate_cid)
    JSON.parse(open("http://www.opensecrets.org/api/?method=candIndustry&cid=#{candidate_cid}&cycle=2014&apikey=#{dev_key}&output=json").read)
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
      candidate.district = candidate_hash["@attributes"]["office"]
      candidate.twitter_id = candidate_hash["@attributes"]["twitter_id"]
      candidate.facebook_id = candidate_hash["@attributes"]["facebook_id"]
      candidate.website = candidate_hash["@attributes"]["website"]
      candidate.phone_number = candidate_hash["@attributes"]["phone"]
      candidate.save
    end
  end

  def update_candidates
    Candidate.all.each do |candidate|
      data = JSON.parse(open("http://www.opensecrets.org/api/?method=candSummary&cid=#{candidate.cid}&cycle=2014&apikey=#{dev_key}&output=json").read)
      info = data["response"]["summary"]["@attributes"]
      candidate.chamber = info["chamber"]
      candidate.total = info["total"]
      candidate.spent = info["spent"]
      candidate.cash_on_hand = info["cash_on_hand"]
      candidate.debt = candidate["debt"]
      candidate.save
    end
  end

  def build_contributions
    Candidate.all.each do |candidate|
      data = fetch_contributions(candidate.cid)
      info = data["response"]["contributors"]["contributor"]
      info.each do |contribution|
        c = Contribution.new
        c.candidate = candidate
        c.donor = Donor.find_or_create_by(name: contribution["@attributes"]["org_name"])
        c.total = contribution["@attributes"]["total"]
        c.individual_amount = contribution["@attributes"]["indivs"]
        c.pac_amount = contribution["@attributes"]["pacs"]
        c.cycle = 2014
        c.save
      end
    end
  end

  def build_industries
    Candidate.all.each do |candidate|
      data = fetch_industry_contributions(candidate.cid)
      info = data["response"]["industries"]["industry"]
      info.each do |contribution|
        c = IndustryContribution.new
        c.candidate = candidate
        c.industry = Industry.find_or_create_by(industry_code: contribution["@attributes"]["industry_code"])
        c.industry.name = contribution["@attributes"]["industry_name"]
        c.total = contribution["@attributes"]["total"]
        c.individual_amount = contribution["@attributes"]["indivs"]
        c.pac_amount = contribution["@attributes"]["parseacs"]
        c.cycle = 2014
        c.save
        c.industry.save
      end
    end
  end

  def state_array #to iterate through and seed database for other states
    %w(AK AL AR AZ CA CO CT DE FL GA HI IA ID IL IN KS KY LA MA MD ME MI MN MO MS MT NC ND NE NH NJ NM NV NY OH OK OR PA RI SC SD TN TX UT VA VT WA WI WV WY)
  end

end
