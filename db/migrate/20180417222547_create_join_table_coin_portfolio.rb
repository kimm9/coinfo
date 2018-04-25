class CreateJoinTableCoinPortfolio < ActiveRecord::Migration[5.0]
  def change
    create_join_table :coins, :portfolios do |t|
      # t.index [:coin_id, :portfolio_id]
      # t.index [:portfolio_id, :coin_id]
    end
  end
end
