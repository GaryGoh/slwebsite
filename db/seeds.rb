# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


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