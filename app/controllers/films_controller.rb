class FilmsController < ApplicationController
  before_action :set_film, only: [:show, :update, :destroy]

  # GET /films
  def index
    @films = Film.filtered_by(filter_params)
                 .ordered_by(order_params)
                 .preload(:genres, :countries)
  end

  # POST /films
  def create
    @film = Film.create(film_params)

    if @film.persisted?
      render 'films/create', status: :created
    else
      render json: { errors: @film.errors.messages }, status: :unprocessable_entity
    end
  end

  # GET /films/:id
  def show
  end

  # PUT /films/:id
  def update
    @film.update(film_params)

    if @film.invalid?
      render json: { errors: @film.errors.messages }, status: :unprocessable_entity
    end
  end

  # DELETE /films/:id
  def destroy
    @film.destroy
    head :no_content
  end

  private

  def filter_params
    params.permit(:title, :year, :rating, :country_id, genre_ids: [])
  end

  def order_params
    params.permit(:sort_field, :sort_direction)
  end

  def film_params
    params.permit(:title, :title_localized, :year, :rating, :description, :poster, country_ids: [], genre_ids: [])
  end

  def set_film
    @film = Film.find(params[:id])
  end
end
