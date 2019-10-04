# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(user_name: "田中太郎", login_id: "tanaka", password: "pass")
User.create(user_name: "鈴木一郎", login_id: "suzuki", password: "pass")
User.create(user_name: "佐藤太一", login_id: "satou", password: "pass")
