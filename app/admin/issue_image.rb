ActiveAdmin.register IssueImage do
  menu :label => "新闻图片",
       :if => proc { can?(:manage, IssueImage) },
       :priority => 4


      controller do
        def permitted_params
          params.permit!
        end
      end

  index do
    selectable_column
    column :description
    column "预览" do |image|
      link_to(image_tag(image.issue_pic.url(:thumb), :height => '100'), image.issue_pic.url(:medium))
    end
    column :created_at
    default_actions
  end

  form do |f|
    f.inputs "新闻图片" do
      f.input :society
      f.input :description, :label => "图片描述"
      if f.object.issue_pic_file_name.nil?
        f.input :issue_pic, :as => :file, :label => "新闻图片"
      else
        f.input :issue_pic, :as => :file, :hint => f.template.image_tag(f.object.issue_pic.url(:thumb)), :label => "新闻图片"
        f.input :_destroy, :as => :boolean, :required => false, :label => '删除照片'
      end
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
