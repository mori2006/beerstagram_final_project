class AddBeweryIdToBeers < ActiveRecord::Migration[5.0]
  def change
    add_column :beers, :brewery_id, :integer
  end
end
