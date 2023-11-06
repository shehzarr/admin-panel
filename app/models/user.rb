class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:free, :premium, :admin]

  def self.ransackable_attributes(auth_object = nil)
    ["address", "company", "created_at", "email", "encrypted_password", "id", "name", "phone_number", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end
end
