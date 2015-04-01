class WelcomeController < ApplicationController

  def index
    @url = "/search"
    @command = "Enter Your Address"
  end

  def searchbyname
    @url = "/search/name"
    @command = "Enter Candidate Name"
    render "welcome/index"
  end


end