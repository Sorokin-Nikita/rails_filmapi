class CountriesController < ApplicationController

  # GET /countries
  def index
    @countries = Country.order(:name)
  end

end
