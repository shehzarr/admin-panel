#db/seeds.rb

require 'faker'
puts "Seeding data to the database ...."

User.destroy_all
Subscription.destroy_all
AdminUser.destroy_all

AdminUser.create!(email: 'admin@gmail.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

30.times do
    @user = User.create!(
        email: Faker::Internet.unique.email,
        password: 'password',
        password_confirmation: 'password',
        name: Faker::Name.unique.name_with_middle,
        address: Faker::Address.unique.street_address,
        company: Faker::Company.unique.name,
        phone_number: Faker::PhoneNumber.unique.cell_phone_with_country_code,
        )
    end

puts "Seeding operation complete !"

20.times do |i|
    name = Faker::Subscription.plan
    price = rand(10..100)
    status = Faker::Subscription.status
    description = Faker::Company.bs
    user_id = (i % 29) + 1  # Ensures user_id is unique and within the range

    Subscription.create(
      name: name,
      price: price,
      status: status,
      description: description,
      user_id: user_id
    )
  end