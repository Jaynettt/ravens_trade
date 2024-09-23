class CreateGoods < ActiveRecord::Migration[7.2]
  def change
    create_table :goods do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
