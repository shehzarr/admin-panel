class PaymentsController < ApplicationController
  def new
    @user = current_user
  end

  def create
    payment_service = PaymentService.new(
      user: current_user,
      stripe_email: params[:stripeEmail],
      stripe_token: params[:stripeToken]
    )

    payment_service.process_payment

    redirect_to root_path
  end
end
