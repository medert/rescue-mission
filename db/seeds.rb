# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


question_1 = Question.create(title: 'This gets seeded first. This should be below another question.', description: 'Just installed rails and rake command is not working at all. Please help me to debug this thing. This must exceed 150 characters. I do not know how to exceed that unless I write useless stuff. cmon. I am running out of things to say. Give me a break!!!!!!!', creator_id: 1)
question_2 = Question.create(title: 'This gets seeded second. This should be above the first seeded question.', description: 'Just installed rails and rake command is not working at all. Please help me to debug this thing. This must exceed 150 characters. I do not know how to exceed that unless I write useless stuff. cmon. I am running out of things to say. Give me a break!!!!!!!', creator_id: 2)
