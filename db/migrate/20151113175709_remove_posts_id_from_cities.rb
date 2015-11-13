class RemovePostsIdFromCities < ActiveRecord::Migration
  def change
  	remove_column :cities, :posts_id, :string
  end
end
