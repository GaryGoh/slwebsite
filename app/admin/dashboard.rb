ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc { I18n.t("active_admin.dashboard") }
  #menu :priority => 1, :if => proc{ can?(:manage, Teacher) },
  #:if => proc{ can?(:manage, User) }

  content :title => proc { I18n.t("active_admin.dashboard") } do
    #div :class => "blank_slate_container", :id => "dashboard_default_message" do
    #  span :class => "blank_slate" do
    #    span I18n.t("active_admin.dashboard_welcome.welcome")
    #    small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #  end
    #end
    #
    #controller do
    #  def index
    #    if current_admin_user.admin_permission.permission_name == "User"
    #      redirect_to admin_issue_path
    #    else
    #      super
    #    end
    #  end
    #end


    columns do
      #最近新闻
      column do
        panel "最近新闻" do
          ul do
            Issue.limit(10).reverse.map do |e|
              if !e.user_id.nil?
                li link_to(if !e.user_id.nil? then
                             e.user.stuid
                           else
                             e.user.name
                           end, admin_user_path(e.user.id)) + " 发表了 " + link_to(e.title, admin_issue_path(e.id)) + " (#{e.created_at.strftime("%b %e, %l:%M %p")})."
              else
                li link_to("后台系统", admin_root_url) + " 发表了 " + link_to(e.title, admin_issue_path(e.id)) + " (#{e.created_at.strftime("%b %e, %l:%M %p")})."
              end
            end
          end
        end

        #统计表
        panel "新闻发布统计表" do
          render "issues", locals: {issues: @issues}
        end
      end

      #新注册用户
      column do
        h3 "新注册用户"
        table class: "index_table index" do

          tr do
            th "学号"
            th "注册时间"
            th "姓名"
            th "加上社团数"
            th "联系方式"
          end
          odd = true
          User.limit(20).find(:all, :order => "created_at DESC").each do |c|
            tr class: odd ? "odd" : "even" do
              td link_to c.stuid, admin_user_path(c.id)
              td c.created_at.strftime("%B #{c.created_at.day.ordinalize} %Y - %H:%M")
              if (c.name.nil?) then
                td "N/A"
              else
                td link_to c.name, admin_user_path(c.id)
              end
              td c.user_societies.count
              td c.contact
            end
            odd = !odd
          end
        end
      end

    end # columns

  end # content
end
