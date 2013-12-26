ActiveAdmin.register Society do
  permit_params :society_name, :department_id, :num_member, :home_url, :is_outstanding,
                user_societies: [:user_id, :society_id]
  actions :all
  menu :label => "社团",
       :if => proc { can?(:manage, Society) }


  index do
    selectable_column
    column :society_name
    column :outstanding do |t|
      if t.is_outstanding == true
        status_tag '优秀社团', :ok
      else
        status_tag '普通社团'
      end
    end
    column :home_url
    column :created_at
    default_actions
  end

  # The form is to create society info
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "学生信息" do
      f.input :society_name
      f.input :department
      f.input :num_member
      f.input :home_url
      f.input :is_outstanding
    end
    f.actions
  end


  show :title => :society_name do |c|
    #@society = Society.find_by_id(params[:id])
    columns do
      column do

        attributes_table do
          row "社团名字" do
            c.to_s
          end
          row "所属中心" do
            c.department
          end
          row "社团会员数" do
            c.num_member
          end
          row "网站会员数" do
            c.user_societies.count
          end
          row "社团新闻数" do
            c.issues.count
          end
          row "社团主页" do
            c.home_url
          end
          row "优秀社团" do |t|
            if t.is_outstanding == true
              status_tag '优秀社团', :ok
            else
              status_tag '普通社团'
            end
          end
        end



      div :class => "panel" do
        h3 "新加入会员"
        if c.user_societies and c.user_societies.count > 0
          div :class => "panel_contents" do
            div :class => "attributes_table" do
              table do
                th do
                  "会员学号"
                end
                th do
                  "会员名字"
                end
                th do
                  "加入时间"
                end

                tbody do
                  c.user_societies.each do |s|
                    tr do
                      td do
                        link_to s.user.stuid, admin_user_path(s.user.id)
                      end
                      td do
                        link_to s.user.name, admin_society_path(s.user.id)
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
        end
      end # end of {div :class => "panel" do}
    end

    column do

      h3 "发布新闻"
      table class: "index_table index" do
        tr do
          th "新闻标题"
          th "新闻类型"
          th "作者"
          th "发布时间"
          th "阅读次数"
        end
        c.issues.each do |e|
          tr do
            td link_to truncate(e.title, :length => 12), admin_issue_path(e.id)
            td e.category
            td link_to e.author, admin_user_path(e.user.id)
            td e.created_at.strftime("%b %e, %l:%M %p")
            td e.title

          end
        end
      end
    end # end of #2 column

  end
end



filter :society_name, :label => "社团名字"
filter :is_outstanding, :label => "是否为优秀社团"
filter :num_member, :label => "社团会员数"
filter :num_registered_member, :label => "网站会员数"
filter :issues, :label => "社团新闻"
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
