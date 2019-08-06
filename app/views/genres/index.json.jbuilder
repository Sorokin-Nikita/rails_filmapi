json.genres do
  json.array! @genres, partial: 'genres/genre', as: :genre
end
