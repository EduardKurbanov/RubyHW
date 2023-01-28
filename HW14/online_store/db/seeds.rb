# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Category.destroy_all
Product.destroy_all
User.destroy_all
AdminUser.destroy_all

Category.create([
    {
        title: "cpu"
    },
    {
        title: "games"
    },
    {
        title: "maus"
    },
])


Product.create([
    {
        name: "amd phenom ii x 6",
        description: "amd phenom ii x 6 T1090",
        price: 1000,
        category_id: 1
    },
    {
        name: "intel xeon",
        description: "intel xeon intel xeon intel xeon",
        price: 2000,
        category_id: 1
    },
    {
        name: "H.A.W.X",
        description: "AIR WAR",
        price: 100,
        category_id: 2
    },
    {
        name: "gta vc",
        description: "gta vc gta vc gta vc",
        price: 20,
        category_id: 2
    },
    {
        name: "a4tech",
        description: "a4tech a4tech a4tech",
        price: 10,
        category_id: 3
    },
    {
        name: "logitech",
        description: "car car car",
        price: 50,
        category_id: 3
    }
])


User.create!(email: 'user@ukr.com', password: 'password', password_confirmation: 'password')
AdminUser.create!(email: 'admin@ukr.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
