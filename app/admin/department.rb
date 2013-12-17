ActiveAdmin.register Department do
  #permit_params :dep_name
  #actions :all, :except => [:edit, :show]
  menu false
  #
  #
  #index do
  #  selectable_column
  #  column :dep_name
  #  column :created_at
  #  default_actions
  #end
  #
  #filter :dep_name
  #filter :created_at

  
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
