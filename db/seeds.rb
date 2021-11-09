# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all


puts "Start seeding Users"
  4.times do 
    users = [
        { name: 'Natz', email: 'natz@mail.com', phone: '975318642', rol: 1 },
        { name: 'Aldo', email: 'aldo@mail.com', phone: '975335642', rol: 1 },
        { name: 'Ana', email: 'anita@mail.com', phone: '971218642', rol: 0 },
        { name: 'Rodrigo', email: 'rodri@mail.com', phone: '975312332', rol: 0 },
        { name: 'Edder', email: 'eder@mail.com', phone: '911112222', rol: 0 },
      ]
  User.create(users)
end
puts "End seeding Users"

puts "Start seeding Ubication"
  9.times do 
    users = [
        { district: 'El Agustino', department: 'Lima'},
        { district: 'S.J.L.', department: 'Lima'},
        { district: 'S.J.M.', department: 'Lima'},
        { district: 'Breña', department: 'Lima'},
        { district: 'Miraflores', department: 'Lima'},
        { district: 'La Victoria', department: 'Lima'},
        { district: 'Surquillo', department: 'Lima'},
        { district: 'Barranco', department: 'Lima'},
        { district: 'Surco', department: 'Lima'},
        { district: 'La Molina', department: 'Lima'}
      ]
  User.create(users)
end
puts "End seeding Users"
