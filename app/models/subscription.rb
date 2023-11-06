class Subscription < ApplicationRecord
  validates :name, :price, :status, presence: true
end
