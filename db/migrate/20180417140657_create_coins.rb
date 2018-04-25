class CreateCoins < ActiveRecord::Migration[5.0]
  def change
    create_table :coins do |t|
      t.string :coin_name
      t.string :symbol
      t.integer :price_usd
      t.integer :percent_change_1h
      t.integer :percent_change_24h
      t.integer :percent_change_7d

      t.timestamps
    end
  end
end
