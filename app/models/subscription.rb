class Subscription < ApplicationRecord
  validates :name, :price, :status, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "name", "price", "status", "updated_at", "user_id"]
  end
end
