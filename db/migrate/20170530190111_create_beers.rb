class CreateBeers < ActiveRecord::Migration[5.0]
  def change
    create_table :beers do |t|
      t.text :name
      t.string :image
      t.integer :user_id
      t.text :brewed_by
      t.text :style
      t.string :descrip
      t.float :abv
      t.string :db_api_beer_id
      t.string :avail
      t.integer :rating

      t.timestamps

    end
  end
end
