# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Role.create(name: 'Admin')
#Role.create(name: 'Leader')
#Role.create(name: 'Guest')


Group.create(name: 'Alpha', date: '2015-8-10 00:00:00')
Group.create(name: 'Bravo', date: '2015-9-10 00:00:00')
Group.create(name: 'Charlie', date: '2015-10-10 00:00:00')


Student.create(name: 'Alice', email: 'alice@abc.com', grade:'10')
Student.create(name: 'Ali', email: 'ali@abc.com', grade:'11')
Student.create(name: 'Ivy', email: 'Ivy@abc.com', grade:'12')
Student.create(name: 'Nelson', email: 'nelson@abc.com', grade:'9')
Student.create(name: 'Bruce', email: 'bruce@abc.com', grade:'10')
Student.create(name: 'Chicang', email: 'chicang@abc.com', grade:'10')
Student.create(name: 'Fahad', email: 'fahad@abc.com', grade:'11')
Student.create(name: 'Munteha', email: 'munteha.ahsan@gmail.com.com', grade:'8')

Topic.create(name: 'Alligators', subject: 'Living')
Topic.create(name: 'Cars and Us', subject: 'Transport')
Topic.create(name: 'Sea Life', subject: 'Living')
