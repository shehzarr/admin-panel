class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :user_email
      t.integer :customer_id
      t.string :amount
      t.string :description
      t.string :currency

      t.timestamps
    end

    add_foreign_key :payments, :users, column: :user_email, primary_key: :email
    add_foreign_key :payments, :users, column: :customer_id, primary_key: :id
  end
end
