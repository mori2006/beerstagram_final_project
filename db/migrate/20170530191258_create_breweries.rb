class CreateBreweries < ActiveRecord::Migration[5.0]
  def change
    create_table :breweries do |t|
      t.text :name
      t.string :image
      t.string :descrip
      t.string :db_api_brewery_id
      t.string :type
      t.integer :est
      t.string :website
      t.string :street_add
      t.string :locality
      t.string :region
      t.integer :zip_code
      t.string :phone
      t.string :lat
      t.string :long

      t.timestamps

    end
  end
end
