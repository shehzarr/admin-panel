ActiveAdmin.register User do

    permit_params :email, :name, :address, :company, :phone_number

    menu label: "Users"

    index do
        column :email
        column :name
        column :address
        column :company
        column :phone_number
    end

   filter :name
   filter :company

   controller { actions :all, except: [:destroy] }

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :role
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :role]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
