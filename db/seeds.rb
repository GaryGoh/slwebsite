# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


AdminPermission.create([
                           {:permission_name => "超级管理员"},
                           {:permission_name => "社联委员"},
                           {:permission_name => "社团主席"}
                       ])

AdminUser.create([
                     {
                         :email => 'gaomingqian90929@gmail.com',
                         :password => 'gmq1990929',
                         :password_confirmation => 'gmq1990929',
                         :admin_permission_id => AdminPermission.first.id,
                         :name => "高铭谦",
                         :sl_department_id => 2

                     }
                 ])


Item.create([
                   {
                       :item_name => "社联主页",
                       :item_url => "root_url"
                   },
                   {
                       :item_name => "站内导航",
                       :item_url => "#"
                   },
                   {
                       :item_name => "社团中心",
                       :item_url => "#"
                   },
                   {
                       :item_name => "用户中心",
                       :item_url => "#"
                   }

               ])


Subitem.create([
                {
                    :subitem_name => "新闻部落",
                    :subitem_url => "news_url"
                },
                {
                    :subitem_name => "活动通知",
                    :subitem_url => "notics_url"
                },
                {
                    :subitem_name => "FAQ",
                    :subitem_url => "faq_url"
                },
                {
                    :subitem_name => "资料下载",
                    :subitem_url => "download_url"
                },
                {
                    :subitem_name => "社联介绍",
                    :subitem_url => "slmember_url"
                },
                {
                    :subitem_name => "公益实践中心",
                    :subitem_url => "gy_url"
                },
                {
                    :subitem_name => "文娱兴趣中心",
                    :subitem_url => "wy_url"
                },
                {
                    :subitem_name => "体育竞技中心",
                    :subitem_url => "ty_url"
                },
                {
                    :subitem_name => "学术科技中心",
                    :subitem_url => "xs_url"
                },
                {
                    :subitem_name => "登录",
                    :subitem_url => "signin_url"
                },
                {
                    :subitem_name => "注册",
                    :subitem_url => "signup_url"
                },
                {
                    :subitem_name => "登出",
                    :subitem_url => "signout_url"
                },
                {
                    :subitem_name => "学术科技中心",
                    :subitem_url => "xs_url"
                }

            ])