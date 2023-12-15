# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :check_account_active, only: [:create]

  private

  def check_account_active
    if params[:user].present?
      user = User.find_by(email: params[:user][:email])

      if user && !user.account_active
        flash[:alert] = 'Your account is suspended. Please contact support.'
        redirect_to new_user_session_path
      end
    end
  end
end
