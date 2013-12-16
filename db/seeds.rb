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