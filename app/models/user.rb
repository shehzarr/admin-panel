class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :subscriptions, dependent: :destroy
  has_many :payments, dependent: :destroy
  enum role: [:free, :premium, :admin]

  def self.ransackable_attributes(auth_object = nil)
    ["account_active", "address", "company", "created_at", "email", "encrypted_password", "id", "name", "phone_number", "remember_created_at", "reset_password_sent_at", "reset_password_token", "role", "updated_at"]
  end
end
