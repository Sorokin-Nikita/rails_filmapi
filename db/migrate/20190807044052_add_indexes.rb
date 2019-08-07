class AddIndexes < ActiveRecord::Migration[6.0]
  def change
    # speed-up queries for fetching film's countries
    add_index :countries_films, :film_id
    # speed-up queries for fetching films by country
    add_index :countries_films, :country_id

    # speed-up queries for fetching film's genres
    add_index :films_genres, :film_id
    # speed-up queries for fetching films by genre
    add_index :films_genres, :genre_id

    # speed-up queries for fetching films rating
    add_index :films, :rating
    # speed-up queries for fetching films by year
    add_index :films, :year
  end
end
