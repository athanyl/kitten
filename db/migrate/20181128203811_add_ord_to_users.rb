class AddOrdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :ord, foreign_key: true
  end
end
