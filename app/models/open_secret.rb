class OpenSecret < ActiveRecord::Base

  dev_key = ENV["open_secret_key"]
  binding.pry
end
