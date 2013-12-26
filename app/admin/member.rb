ActiveAdmin.register Member do
  permit_params :memid
  actions :all, :except => [:edit, :show]
  menu :label => "会员学号",
  :if => proc{ can?(:manage, Member) },
  :priority => 3


  index do
    selectable_column
    column :memid
    column :created_at
    default_actions
  end

  filter :memid
  filter :created_at

  #Member.exists?(:memid => self.stuid)
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
