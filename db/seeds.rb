# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.find_or_create_by_name(:name => :admin)
Role.find_or_create_by_name(:name => :user)
Role.find_or_create_by_name(:name => :employee)
Role.find_or_create_by_name(:name => :newsmaker)
Status.find_or_create_by_name(:name => :new)
Status.find_or_create_by_name(:name => :closed)
