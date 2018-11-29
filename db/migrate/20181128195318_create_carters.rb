class CreateCarters < ActiveRecord::Migration[5.2]
  def change
    create_table :carters do |t|
      t.references :item, foreign_key: true
      t.references :cart, foreign_key: true

      t.timestamps
    end
  end
end
