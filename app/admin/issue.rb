ActiveAdmin.register Issue do

  menu :label => "新闻",
       :if => proc { can?(:manage, Issue) },
       :priority => 4

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
    column :category
    column :author
    column :created_at
    column :updated_at
    actions
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

    unless f.object.new_record?
      f.inputs "新闻图片" do
        @issue = Issue.find_by_id(params[:id])
        f.has_many :issue_images do |fm|
          if fm.object.issue_pic_file_name.nil?
            fm.input :issue_pic, :as => :file, :label => "新闻图片"
          else
            fm.input :issue_pic, :as => :file, :hint => fm.template.image_tag(fm.object.issue_pic.url(:thumb)), :label => "新闻图片"
            fm.input :_destroy, :as => :boolean, :required => false, :label => '删除照片'
          end
          fm.input :society, :collection => Society.where("id = #{@issue.society_id}").map { |s| [s.to_s, s.id] }

        end
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
