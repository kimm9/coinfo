class Portfolio < ApplicationRecord
  has_and_belongs_to_many :coins
  belongs_to :user
end
