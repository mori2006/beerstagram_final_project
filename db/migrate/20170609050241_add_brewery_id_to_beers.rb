class AddBreweryIdToBeers < ActiveRecord::Migration[5.0]
  def change
    add_column :beers, :bewery_id, :integer
  end
end
