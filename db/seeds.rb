# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

income = Category.create(id:1, name: '收入项目')
outlay = Category.create(id:2, name: '支出项目')

incomes = Category.create([{id:3, name: '工资', category: income},
                           {id:4, name: '礼金', category: income},
                           {id:5, name: '兼职', category: income},
                           {id:6, name: '其他收入', category: income}
                          ])

outlays = Category.create([{id:7, name: '交通', category: outlay},
                           {id:8, name: '饮食', category: outlay},
                           {id:9, name: '服饰美容', category: outlay},
                           {id:10, name: '日常开支', category: outlay},
                           {id:11, name: '房产', category: outlay}
                          ])