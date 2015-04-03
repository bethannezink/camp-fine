class IndustriesController < ApplicationController

  def show
    @industry = Industry.find(params[:id])
    @industry_contributions = @industry.industry_contributions
  end

end
