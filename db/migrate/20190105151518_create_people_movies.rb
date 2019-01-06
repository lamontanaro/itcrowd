class CreatePeopleMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :people_movies do |t|
      t.references :person, foreign_key: true
      t.references :movie, foreign_key: true
      t.integer :role

      t.timestamps
    end
  end
end
