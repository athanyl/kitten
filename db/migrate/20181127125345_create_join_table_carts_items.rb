class CreateJoinTableCartsItems < ActiveRecord::Migration[5.2]
  def change
    create_join_table :carts, :items do |t|
      t.index [:cart_id, :item_id], index: true, foreign_key: true
      t.index [:item_id, :cart_id], index: true, foreign_key: true
    end
  end
end
