class CreateJoinTalbeCoinPortfolio < ActiveRecord::Migration[5.0]
  def change
    create_table :join_talbe_coin_portfolios do |t|
      t.string :coin
      t.string :portfolio
    end
  end
end
