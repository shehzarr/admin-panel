# Admin Panel Boilerplate for Rails

It uses Devise gem for authentication, ActiveAdmin gem for admin panel and Stripe for payment/subscription management.

## Features

- Login
- Signup
- Forgot Password
- Reset Password
- Remember Me
- Admin authentication with admin privileges.
- User subscription management - Multiple plans available
- Stripe Integration for payment
- Roles setup in the admin panel after subscription type
- Subscription billing and payment history.
- User account suspension and reactivation through admin panel
- CRUD Operations for Models inside Admin Panel
- Multiple Filteration ability for Models inside Admin Panel

## Libraries Used

This boilerplate uses the following libraries:

**Devise** gem
for Authentication

**ActiveAdmin** gem
for Admin Panel

**stripe** gem
for payments

## How to run

### Pre Requisite
- Rails 7
- Ruby 3.0.2
- Postgres Database

0. Make sure you have prerequisites installed in your machine
1. Clone this repo in your local machine
2. run `bundle install`
3. run `rails db:create`
4. run `rails db:migrate`
5. run `rails db:seed`
6. run `rails server`
7. go to http://localhost:3000/

### Access Admin Panel

Go to: http://localhost:3000/admin
