['Россия', 'Великобритания', 'Германия', 'Франция', 'Италия'].each do |name|
  country = Country.find_or_initialize_by(name: name)
  country.save if country.new_record?
end

['Ужасы', 'Комедия', 'Фантастика', 'Триллер', 'Артхаус'].each do |name|
  genre = Genre.find_or_initialize_by(name: name)
  genre.save if genre.new_record?
end
