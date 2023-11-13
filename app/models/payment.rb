# app/models/payment.rb

class Payment < ApplicationRecord
  belongs_to :user, foreign_key: 'user_email', primary_key: 'email'
  belongs_to :customer, class_name: 'User', foreign_key: 'customer_id', primary_key: 'id'
end
