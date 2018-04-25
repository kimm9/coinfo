class CreatePortfolios < ActiveRecord::Migration[5.0]
  def change
    create_table :portfolios do |t|
      t.string :title
      t.string :user_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
