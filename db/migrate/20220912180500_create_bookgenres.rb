class CreateBookgenres < ActiveRecord::Migration[7.0]
  def change
    create_table :bookgenres do |t|
      t.string :book_id
      t.string :genre_id
    end
  end
end
