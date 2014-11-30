ActiveAdmin.register ActiveAdmin::Comment do

  menu :label => "所有评论",
       :if => proc { can?(:manage, Comment) },
       :priority => 7
  actions :all



  controller do
    def permitted_params
      params.permit!
    end
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
