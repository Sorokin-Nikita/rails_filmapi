json.id film.id

json.title           film.title
json.title_localized film.title_localized
json.year            film.year
json.rating          film.rating

json.genres film.genres, partial: 'genres/genre', as: :genre
json.countries   film.countries, partial: 'countries/country', as: :country

unless defined? short_form
  json.description film.description

  json.poster do
    if film.poster.present?
      # sample resizing - to fit all the images in a same frame
      json.url rails_representation_url(film.poster.variant(resize: "420x600").processed)
    end
  end
end
