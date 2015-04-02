# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

api = OpenSecret.new
api.state_array.each do |state|
  api.build_candidates(state)
end
api.update_candidates(Candidate.all)
api.build_industries(Candidate.all)
api.build_contributions(Candidate.all)

