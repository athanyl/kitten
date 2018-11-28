class CreateOrds < ActiveRecord::Migration[5.2]
  def change
    create_table :ords do |t|

      t.timestamps
    end
  end
end
