ActiveAdmin.register User do

  controller do
    def permitted_params
      params.permit user: [:stuid, :email, :password, :password_confirmation, :name, :gender, :contact, :department, :proverb, :admin]
    end
  end

  # Index page form
  index do
    column :stuid
    column :email
    column :name
    column :gender
    column :contact
    column :department
    default_actions
  end

  # The form is to create public student user info
  form do |f|
    f.inputs "学生信息" do
      f.input :stuid
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

end
