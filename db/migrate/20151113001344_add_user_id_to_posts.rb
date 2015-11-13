class AddUserIdToPosts < ActiveRecord::Migration

  change_table :posts do |t|

      t.references :user
  end
end
