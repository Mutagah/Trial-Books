class CreateGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :genres do |t|
      t.string :fiction
      t.string :romance
      t.string :horror
      t.string :sci_fi 
    end
  end
end
