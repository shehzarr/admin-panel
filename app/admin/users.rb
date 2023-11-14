ActiveAdmin.register User do
    permit_params :email, :name, :address, :company, :phone_number, :role, :account_active

    menu label: "Users"

    index do
      column :email
      column :name
      column :address
      column :company
      column :phone_number
      column :role
      column :account_active

      actions defaults: false do |user|
        link_to 'View', admin_user_path(user), class: 'member_link'
        if user.account_active
          link_to 'Suspend Account', suspend_admin_user_path(user), method: :put, class: 'member_link'
        else
          link_to 'Activate Account', activate_admin_user_path(user), method: :put, class: 'member_link'
        end
      end
    end

    member_action :suspend, method: :put do
      resource.update(account_active: false)
      redirect_to admin_users_path, notice: "Account suspended!"
    end

    member_action :activate, method: :put do
      resource.update(account_active: true)
      redirect_to admin_users_path, notice: "Account activated!"
    end

    filter :name
    filter :company
    filter :role
    filter :account_active

    controller { actions :all, except: [:destroy] }
  end
