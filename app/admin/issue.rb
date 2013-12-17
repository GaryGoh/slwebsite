ActiveAdmin.register Issue do

  menu :label => "新闻",
  :if => proc{ can?(:manage, Issue) }

  controller do
    def permitted_params
      params.permit issue: [:title, :content, :date, :author, :user_id, :category_id]
    end
  end

  index do
    selectable_column
    column :id
    column :title
    column :category_id
    column :author
    column :created_at
    column :updated_at
    default_actions
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
