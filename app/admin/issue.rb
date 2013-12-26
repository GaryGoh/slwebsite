ActiveAdmin.register Issue do

  menu :label => "新闻",
       :if => proc { can?(:manage, Issue) },
       :priority => 4

  #action_item :only => [:show], :if => proc {current_admin_user == "社团主席" }


  controller do
    def permitted_params
      params.permit issue: [:title, :content, :date, :author, :user_id, :category_id, :issue_pic]
    end
  end

  index do
    selectable_column
    column :id
    column :title
    column :category
    column :author
    column :created_at
    column :updated_at
    default_actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
      f.inputs "新闻信息" do
        f.input :title, :label => "标题"
        f.input :content, :label => "新闻内容"
        f.input :user, :label => "作者"
      end
    f.inputs "新闻类别" do
      f.input :category, :label => "新闻类别"
      f.input :society, :label => "所属社团"
    end

    f.inputs "新闻图片" do
      if f.object.issue_pic_file_name.nil?
        f.input :issue_pic, :as => :file, :label => "新闻图片"
      else
        f.input :issue_pic, :as => :file, :hint => f.template.image_tag(f.object.issue_pic.url(:thumb)), :label => "新闻图片"
      end
    end
    f.actions
  end

  filter :title, :label => "新闻标题"
  filter :content, :label => "内容"
  filter :user, :label => "作者"
  filter :category, :label => "新闻类别"
  filter :society, :label => "所属社团"
  filter :created_at, :label => "创建于"



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
