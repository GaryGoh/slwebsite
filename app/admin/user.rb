ActiveAdmin.register User do
  # Here has a bug when update societies, which will get a old records from last time.
  #permit_params :stuid, :email, :password, :password_confirmation, :name,
  #              :gender_id, :contact, :society_id, :proverb, :member_id, :is_active, :avatar,
  #              societies_attributes:[:id, :society_name],
  #              user_attributes: [:id],
  #              user_societies_update_attributes:[:society_id],
  #              user_societies: [:society_id, :user_id]
  #              #users_attributes:[:user],

  controller do
    def permitted_params
      params.permit!
    end
  end

  menu :label => "公共用户",
       :if => proc { can?(:manage, User) }
  actions :all


  show :title => :email do |c|
    @user = User.find_by_id(params[:id])
    columns do
      column do

        attributes_table do
          row :name
          row :email
          row :gender
          row :contact
          row :created_at
          row :proverb do
            simple_format (c.proverb)
          end


        end
        div :class => "panel" do
          h3 "所属社团"
          if c.user_societies and c.user_societies.count > 0
            div :class => "panel_contents" do
              div :class => "attributes_table" do
                table do
                  th do
                    "所属中心"
                  end
                  th do
                    "社团名字"
                  end
                  th do
                    "加入时间"
                  end

                  tbody do
                    c.user_societies.each do |s|
                      tr do
                        td do
                          link_to s.society.department, admin_department_path(s.society.department.id)
                        end
                        td do
                          link_to s.society, admin_society_path(s.society.id)
                        end
                        td do
                          s.created_at.strftime("%F")
                        end
                      end
                    end
                  end
                end
              end
            end
          else
            h3 "尚未加入社团"
          end
        end # end of {div :class => "panel" do}
      end

      column do

        h3 "发布新闻"
        table class: "index_table index" do
          tr do
            th "新闻标题"
            th "发布时间"
            th "新闻类型"
            th "评论数"
            th "阅读次数"
          end
          @user.issues.each do |e|
            tr do
              td link_to e.title, admin_issue_path(e.id)
              td e.created_at.strftime("%b %e, %l:%M %p")
              td e.category
              td e.title
              td e.title

            end
          end
        end
      end # end of #2 column

    end
  end


# Index page form
  index do
    selectable_column
    column :state do |t|
      if t.is_active == true
        status_tag 'active', :ok
      else
        status_tag 'inactive'
      end

    end
    column :stuid
    column :name
    column :gender
    column :contact
    default_actions
  end


# The form is to create public student user info
  form do |f|
    f.semantic_errors *f.object.errors.keys
    if f.object.new_record?
      f.inputs "基本信息" do
        f.input :stuid, :label => "学号"
        f.input :email
        f.input :password
        f.input :password_confirmation
      end
    end

    f.inputs "学生信息" do
      f.input :name, :label => "姓名"
      f.input :gender, :label => "性别"
      f.has_many :user_societies do |fm|
        fm.input :society, :label => "所属社团"
      end
      f.input :contact, :label => "联系方式"
      if f.object.avatar.nil?
        f.input :avatar, :as => :file, :label => "个人头像"
      else
        f.input :avatar, :as => :file, :hint => f.template.image_tag(f.object.avatar.url(:thumb)), :label => "个人头像"
      end
      f.input :proverb, :label => "个人简介"
    end

    f.inputs "账号状态" do
      f.input :is_active, :label => "激活"
    end
    f.actions
  end


#show do
#
#end


  filter :stuid, :label => "学号"
  filter :name, :label => "姓名"
  filter :email
  filter :gender, :label => "性别"
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
