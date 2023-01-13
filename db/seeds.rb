# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

cust_1 = Customer.create!(first_name: "Randy", last_name: "Bobandy", email: "asstsupervisor@sunnyvale.ca", address: "123 Sunnyvale Lane")
sub_1 = Subscription.create!(title: "Holiday", price: 22.10, frequency: "weekly")
sub_2 = Subscription.create!(title: "summer", price: 10.10, frequency: "biweekly")
sub_3 = Subscription.create!(title: "Winter", price: 15.10, frequency: "monthly")
sub_4 = Subscription.create!(title: "Fall", price: 20.20, frequency: "weekly")


CustomerSubscription.create!(customer: cust_1, subscription: sub_1, status: "active")
CustomerSubscription.create!(customer: cust_1, subscription: sub_2, status: "active")
CustomerSubscription.create!(customer: cust_1, subscription: sub_4, status: "active")