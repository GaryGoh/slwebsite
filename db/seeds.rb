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
                     {:email => 'gaomingqian90929@gmail.com',
                      :password => 'gmq1990929',
                      :password_confirmation => 'gmq1990929',
                      :admin_permission_id => AdminPermission.first.id}
                 ])

Category.create([
                    {:category_name => "学校新闻"},
                    {:category_name => "社团新闻"},
                    {:category_name => "活动新闻"}

                ])

Department.create([
                      {:dep_name => "公益实践中心"},
                      {:dep_name => "文娱兴趣中心"},
                      {:dep_name => "体育竞技中心"},
                      {:dep_name => "学术科技中心"}
                  ])

Gender.create([
                  {:gender_name => "男"},
                  {:gender_name => "女"},
                  {:gender_name => "其他"}
              ])

SlDepartment.create([
                        {:sl_dep_name => "主席团"},
                        {:sl_dep_name => "公益实践中心"},
                        {:sl_dep_name => "文娱兴趣中心"},
                        {:sl_dep_name => "体育竞技中心"},
                        {:sl_dep_name => "学术科技中心"},
                        {:sl_dep_name => "微博中心"},
                        {:sl_dep_name => "办公室"},
                        {:sl_dep_name => "网络部"},
                        {:sl_dep_name => "外联部"},
                        {:sl_dep_name => "财务部"},
                        {:sl_dep_name => "新闻部"},
                        {:sl_dep_name => "组织部"}
                    ])