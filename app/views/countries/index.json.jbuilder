json.countries do
  json.array! @countries, partial: 'countries/country', as: :country
end
