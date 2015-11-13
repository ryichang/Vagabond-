class AddCityIdToPosts < ActiveRecord::Migration

  change_table :posts do |t|

      t.references :city
  end


end
