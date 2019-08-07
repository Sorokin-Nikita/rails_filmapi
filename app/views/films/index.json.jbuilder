json.films do
  json.array! @films, partial: 'films/film', as: :film, locals: { short_form: true }
end

json.pagination_meta do
  json.page @page
  json.per_page @per_page
  json.total_count @total_count
end
