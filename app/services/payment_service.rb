class PaymentService
    def initialize(user:, stripe_email:, stripe_token:)
      @user = user
      @stripe_email = stripe_email
      @stripe_token = stripe_token
    end
  
    def process_payment
      create_stripe_customer
      create_stripe_charge
      create_payment_record
      create_subscription
    rescue Stripe::CardError => e
      handle_payment_error(e.message)
    end
  
    private
  
    def create_stripe_customer
      @customer = Stripe::Customer.create({
        email: @stripe_email,
        source: @stripe_token
      })
    end
  
    def create_stripe_charge
      @charge = Stripe::Charge.create({
        customer: @customer.id,
        amount: 500,
        description: 'Description of Membership',
        currency: 'usd'
      })
    end
  
    def create_payment_record
      Payment.create!(
        user_email: @user.email,
        customer_id: @user.id,
        amount: @charge.amount / 100,
        description: @charge.description,
        currency: @charge.currency
      )
    end
  
    def create_subscription
      Subscription.create(
        name: 'Subscription',
        price: @charge.amount / 100,
        status: 'Active',
        description: @charge.description,
        user_id: @user.id
      )
    end
  
    def handle_payment_error(message)
      flash[:error] = message
      redirect_to new_payment_path
    end
  end
  