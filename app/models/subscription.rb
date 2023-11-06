class Subscription < ApplicationRecord
  validates :name, :price, :status, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[id name price status created_at updated_at]
  end
end
