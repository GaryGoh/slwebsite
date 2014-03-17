ActiveAdmin.register Noti do

  menu :label => "活动通知",
       :if => proc { can?(:manage, Noti) },
       :priority => 5

  #action_item :only => [:show], :if => proc {current_admin_user == "社团主席" }


  controller do
    def permitted_params
      #params.permit issue: [:title, :content, :date, :author, :user_id, :category_id, :issue_pic, :society_id, :issue_images_attributes]
      params.permit!
    end
  end

  index do
    selectable_column
    column :id
    column :title
    column :created_at
    column :start_time
    column :end_time

    default_actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys


    f.inputs "活动信息" do
      f.input :title, :label => "活动主题"
      f.input :content, :label => "活动内容内容"
      f.input :society, :label => "发起组织"
      f.input :start_time, :label => "开始时间"
      f.input :end_time, :label => "结束时间"
      f.input :location, :label => "地点"

    end


    f.actions
  end

  filter :title, :label => "活动标题"
  filter :content, :label => "活动内容"
  filter :society, :label => "发起组织"
  filter :start_time, :label => "活动开始于"
  filter :end_time, :label => "活动结束于"



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
