ActiveAdmin.register User do
  permit_params :stuid, :email, :password, :password_confirmation, :name,
                :gender_id, :contact, :society_id, :proverb, :member_id, :is_active

  menu :label => "公共用户",
       :if => proc{ can?(:manage, User) }
  actions :all


  # Index page form
  index do
    selectable_column
    column :state do |t|
      if t.is_active == true
        status_tag 'active', :ok
      else
        status_tag 'inactive'
      end

    end
    column :stuid
    column :name
    column :gender
    column :contact
    column :society
    default_actions
  end


  # The form is to create public student user info
  form do |f|
    f.semantic_errors *f.object.errors.keys
    if f.object.new_record?
      f.inputs "基本信息" do
        f.input :stuid, :label => "学号"
        f.input :email
        f.input :password
        f.input :password_confirmation
      end
    end
    f.inputs "学生信息" do
      f.input :name, :label => "姓名"
      f.input :gender, :label => "性别"
      f.input :society, :label => "所属社团"
      f.input :contact, :label => "联系方式"
      f.input :proverb, :label => "个人简介"
    end
    f.inputs "账号状态" do
      f.input :is_active, :label => "激活"
    end
    f.actions
  end


  filter :stuid
  filter :name
  filter :email
  filter :gender
  filter :society
  filter :created_at


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
