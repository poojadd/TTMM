# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = description.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   EventType.create(name: 'Emanuel', description: 'food')

p 'eventtype seeds'
EventType.create(name: 'Lunch', description: 'food')
EventType.create(name: 'Dinner', description: 'food')
EventType.create(name: 'Snacks', description: 'food')
p 'end eventtype seed'