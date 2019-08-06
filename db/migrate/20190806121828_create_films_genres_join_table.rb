class CreateFilmsGenresJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :films, :genres
  end
end
