class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :sect
      t.string :address
      t.string :genre
      t.text :about
      t.string :image
      t.timestamps
    end
  end
end
