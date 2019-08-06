class CreateCountriesFilmsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :countries, :films
  end
end
