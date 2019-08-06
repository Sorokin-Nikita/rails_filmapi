class CreateFilms < ActiveRecord::Migration[6.0]
  def change
    create_table :films do |t|
      t.string  :title,           null: false
      t.string  :title_localized, null: false
      t.integer :year,            null: false
      t.integer :rating,          null: false, default: 0
      t.text    :description

      t.timestamps
    end
  end
end
