class DonorsController < ApplicationController

  def show
    @donor = Donor.find(params[:id])
    @candidates = @donor.candidates
    @contributions = @donor.contributions
  end
end
