# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Ubication.destroy_all



puts "Start seeding Users"
  4.times do 
    users = [
        { name: 'Natz', email: 'natz@mail.com', phone: '975318642', role: 1 , password: "123456"},
        { name: 'Aldo', email: 'aldo@mail.com', phone: '975335642', role: 1  , password: "123456"},
        { name: 'Ana', email: 'anita@mail.com', phone: '971218642', role: 0 , password: "123456"},
        { name: 'Rodrigo', email: 'rodri@mail.com', phone: '975312332', role: 0  , password: "123456"},
        { name: 'Edder', email: 'eder@mail.com', phone: '911112222', role: 0 , password: "123456"}
      ]
  User.create(users)
end
puts "End seeding Users"

puts "Start seeding Ubication"
  9.times do 
    ubications = [
        { district: 'El Agustino', departament: 'Lima'},
        { district: 'S.J.L.', departament: 'Lima'},
        { district: 'S.J.M.', departament: 'Lima'},
        { district: 'Breña', departament: 'Lima'},
        { district: 'Miraflores', departament: 'Lima'},
        { district: 'La Victoria', departament: 'Lima'},
        { district: 'Surquillo', departament: 'Lima'},
        { district: 'Barranco', departament: 'Lima'},
        { district: 'Surco', departament: 'Lima'},
        { district: 'La Molina', departament: 'Lima'}
      ]
  Ubication.create(ubications)
end
puts "End seeding Users"
