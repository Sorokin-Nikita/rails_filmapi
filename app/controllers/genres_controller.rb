class GenresController < ApplicationController

  # GET /genres
  def index
    @genres = Genre.order(:name)
  end

end
