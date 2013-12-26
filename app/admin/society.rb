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
    @society = Society.find_by_id(params[:id])
    columns do
      column do

        attributes_table do
          row "社团名字" do
            c.to_s
          end
          row "所属中心" do
            c.department
          end
          row "会员数" do
            c.num_member
          end
          row "网站会员数" do
            c.user_societies.count
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

      #  div :class => "panel" do
      #    h3 "所属社团"
      #    if c.user_societies and c.user_societies.count > 0
      #      div :class => "panel_contents" do
      #        div :class => "attributes_table" do
      #          table do
      #            th do
      #              "所属中心"
      #            end
      #            th do
      #              "社团名字"
      #            end
      #            th do
      #              "加入时间"
      #            end
      #
      #            tbody do
      #              c.user_societies.each do |s|
      #                tr do
      #                  td do
      #                    link_to s.society.department, admin_department_path(s.society.department.id)
      #                  end
      #                  td do
      #                    link_to s.society, admin_society_path(s.society.id)
      #                  end
      #                  td do
      #                    s.created_at.strftime("%F")
      #                  end
      #                end
      #              end
      #            end
      #          end
      #        end
      #      end
      #    else
      #      h3 "尚未加入社团"
      #    end
      #  end # end of {div :class => "panel" do}
      #end
      #
      #column do
      #
      #  h3 "发布新闻"
      #  table class: "index_table index" do
      #    tr do
      #      th "新闻标题"
      #      th "发布时间"
      #      th "新闻类型"
      #      th "评论数"
      #      th "阅读次数"
      #    end
      #    @user.issues.each do |e|
      #      tr class: odd ? "odd" : "even" do
      #        td link_to e.title, admin_issue_path(e.id)
      #        td e.created_at.strftime("%b %e, %l:%M %p")
      #        td e.category
      #        td e.title
      #        td e.title
      #
      #      end
      #    end
      #  end
      #end # end of #2 column

      end

    end
  end


  filter :society_name
  filter :is_outstanding
  filter :num_member
  filter :created_at


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
