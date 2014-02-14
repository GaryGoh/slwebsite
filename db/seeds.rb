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

Society.create([
                   {
                       :society_name => "茶文化协会",
                       :department_id => "1",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "KAB创业俱乐部",
                       :department_id => "1",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "就业与职业发展协会",
                       :department_id => "1",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "实践协会",
                       :department_id => "1",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "心理科学协会",
                       :department_id => "1",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "营销协会",
                       :department_id => "1",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "根与芽环境社",
                       :department_id => "1",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "青年志愿者协会",
                       :department_id => "1",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "蒲公英爱心社",
                       :department_id => "1",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "联想idea精英汇",
                       :department_id => "1",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "校友工作志愿者协会",
                       :department_id => "1",
                       :is_outstanding => false
                   },
                   # 11
                   {
                       :society_name => "摄影协会",
                       :department_id => "2",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "交际舞协会",
                       :department_id => "2",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "武术协会",
                       :department_id => "2",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "精武俱乐部",
                       :department_id => "2",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "异域动漫社",
                       :department_id => "2",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "音乐协会",
                       :department_id => "2",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "名族管乐协会",
                       :department_id => "2",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "青年军迷学会",
                       :department_id => "2",
                       :is_outstanding => false
                   },
                   # 8
                   {
                       :society_name => "排球协会",
                       :department_id => "3",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "裁判协会",
                       :department_id => "3",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "定向越野协会",
                       :department_id => "3",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "足球协会",
                       :department_id => "3",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "网球俱乐部",
                       :department_id => "3",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "方圆棋艺协会",
                       :department_id => "3",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "滑轮协会",
                       :department_id => "3",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "乒乓球爱好者协会",
                       :department_id => "3",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "台球俱乐部",
                       :department_id => "3",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "羽毛球协会",
                       :department_id => "3",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "自行车协会",
                       :department_id => "3",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "篮球社",
                       :department_id => "3",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "瑜伽协会",
                       :department_id => "3",
                       :is_outstanding => false
                   },
                   # 13
                   {
                       :society_name => "国际语言协会",
                       :department_id => "4",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "枫桥文学社",
                       :department_id => "4",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "论谈社",
                       :department_id => "4",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "书画协会",
                       :department_id => "4",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "数学建模协会",
                       :department_id => "4",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "英语协会",
                       :department_id => "4",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "电子爱好者协会",
                       :department_id => "4",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "DIY计算机协会",
                       :department_id => "4",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "樱花日语社",
                       :department_id => "4",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "设计协会",
                       :department_id => "4",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "模拟联合国协会",
                       :department_id => "4",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "原创势力漫画协会",
                       :department_id => "4",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "德鲁克管理协会",
                       :department_id => "4",
                       :is_outstanding => false
                   },

                   {
                       :society_name => "翻译协会",
                       :department_id => "4",
                       :is_outstanding => false
                   },
               # 14
               ])

Gender.create([
                  {
                      :gender_name => "男",
                  },
                  {
                      :gender_name => "女",
                  },
                  {
                      :gender_name => "其他",
                  }
              ])

SlDepartment.create([
                        {
                            :sl_dep_name => "主席团",
                        },
                        {
                            :sl_dep_name => "公益实践中心",
                        },
                        {
                            :sl_dep_name => "文娱兴趣中心",
                        },
                        {
                            :sl_dep_name => "科技实践中心",
                        },
                        {
                            :sl_dep_name => "体育竞技中心",
                        },
                        {
                            :sl_dep_name => "外联部",
                        },
                        {
                            :sl_dep_name => "财务部",
                        },
                        {
                            :sl_dep_name => "网络部",
                        },
                        {
                            :sl_dep_name => "办公室",
                        },
                        {
                            :sl_dep_name => "新闻部",
                        }
                    ])

Department.create([
                      {
                          :dep_name => "公益实践中心",
                      },
                      {
                          :dep_name => "文娱兴趣中心",
                      },
                      {
                          :dep_name => "科技实践中心",
                      },
                      {
                          :dep_name => "体育竞技中心",
                      }
                  ])

Category.create([
                    {
                        :category_name => "顶置新闻",
                        :id => 1
                    },
                    {
                        :category_name => "社团新闻",
                        :id => 2
                    },
                    {
                        :category_name => "学校新闻",
                        :id => 3
                    },
                    {
                        :category_name => "活动通知",
                        :id => 11
                    },
                    {
                        :category_name => "公告通知",
                        :id => 12
                    },
                    {
                        :category_name => "精品活动",
                        :id => 13
                    }
                ])