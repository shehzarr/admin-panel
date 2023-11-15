class PaymentsController < ApplicationController
  def new
    @user = current_user
  end

  def create
    begin
      customer = Stripe::Customer.create({
        :email => params[:stripeEmail],
        :source => params[:stripeToken]
      })

      charge = Stripe::Charge.create({
        :customer => customer.id,
        :amount => 500,
        :description => 'Description of Membership',
        :currency => 'usd'
      })

      Payment.create!(
        user_email: current_user.email,
        customer_id: current_user.id,
        amount: charge.amount/100,
        description: charge.description,
        currency: charge.currency
      )

      Subscription.create(
        name: 'Subscription',
        price: charge.amount/100,
        status: 'Active',
        description: charge.description,
        user_id: current_user.id
      )

      flash[:success] = "Payment was successful!"
      redirect_to root_path

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_payment_path
    end
  end
end
