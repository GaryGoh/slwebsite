ActiveAdmin.register SlDepartment do
  permit_params :sl_dep_name
  actions :all, :except => [:edit, :show]
  menu :label => "社联机构"


  index do
    selectable_column
    column :sl_dep_name
    column :created_at
    default_actions
  end

  # The form is to create society info
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "机构名字" do
      f.input :sl_dep_name
    end
    f.actions
  end

  filter :sl_dep_name
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
