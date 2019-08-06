json.films do
  json.array! @films, partial: 'films/film', as: :film, locals: { short_form: true }
end
