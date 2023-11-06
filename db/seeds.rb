#db/seeds.rb

require 'faker'
puts "Seeding data to the database ...."

AdminUser.create!(email: 'admin@gmail.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

User.destroy_all

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