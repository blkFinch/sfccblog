# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(screen_name:"finch", email:"finch@email.com", password:"finchpass", 
            password_confirmation:"finchpass", name:"Galen Hutchison", permission: 3)

User.create(screen_name:"scout", email:"scouty@email.com", password:"password", 
      password_confirmation:"password", name: "Scout" permission: 2)

User.create(screen_name:"user", email:"user@user.com", password:"password", 
      password_confirmation:"password", name: "User" permission: 1)

User.create(screen_name:"alison", email:"alison.johnson@sfcc.edu", name:"alison johnson", permission: 3, 
            password:"changemenow", password_confirmation:"changemenow")