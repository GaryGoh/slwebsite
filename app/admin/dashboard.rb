ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc { I18n.t("active_admin.dashboard") }

  content :title => proc { I18n.t("active_admin.dashboard") } do
    #div :class => "blank_slate_container", :id => "dashboard_default_message" do
    #  span :class => "blank_slate" do
    #    span I18n.t("active_admin.dashboard_welcome.welcome")
    #    small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #  end
    #end


    columns do
      column do
        panel "最近新闻" do
          ul do
            Issue.limit(10).map do |e|
              li link_to(if (e.user.name.nil?) then
                           e.user.stuid
                         else
                           e.user.name
                         end, admin_user_path(e.user.id)) + " 发表了 " + link_to(e.title, admin_issue_path(e.id)) + " (#{e.created_at.strftime("%b %e, %l:%M %p")})."
            end
          end
        end
      end
      column do
        panel "新闻发布统计表" do
          render "issues"
        end
      end
    end


    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
