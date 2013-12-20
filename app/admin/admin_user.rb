ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirm, :admin_permission_id,
                :gender_id, :society_id, :sl_department_id, :name, :proverb
  menu :label => "管理员", :priority => 2,
  :if => proc{ can?(:manage, AdminUser) }
  #controller.authorize_resource



  index do
    selectable_column
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  filter :email

  form do |f|
    if f.object.new_record?
      f.inputs "登录信息" do
        f.input :email
        f.input :password
        f.input :password_confirmation
      end
    end

    f.inputs "用户信息" do
      f.input :name
      f.input :gender
      f.input :society
      f.input :contact
      f.input :proverb
    end

    f.inputs "权限级别" do
      f.input :admin_permission
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
