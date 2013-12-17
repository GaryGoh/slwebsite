ActiveAdmin.register Society do
  permit_params :society_name, :department_id, :num_member, :home_url, :is_outstanding
  actions :all
  menu :label => "社团"


  index do
    selectable_column
    column :society_name
    column :outstanding do |t|
      if t.is_outstanding == true
        status_tag '优秀社团', :ok
      else
        status_tag '普通社团'
      end
    end
    column :home_url
    column :created_at
    default_actions
  end

  # The form is to create society info
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "学生信息" do
      f.input :society_name
      f.input :department
      f.input :num_member
      f.input :home_url
      f.input :is_outstanding
    end
    f.actions
  end

  filter :society_name
  filter :is_outstanding
  filter :num_member
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
