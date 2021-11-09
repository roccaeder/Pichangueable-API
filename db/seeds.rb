# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Ubication.destroy_all
Field.destroy_all
Review.destroy_all
puts "Start seeding Users"
  5.times do
    users = [
        { name: 'Natz', email: 'natz@mail.com', phone: '975318642', role: 1 , password: "123456"},
        { name: 'Aldo', email: 'aldo@mail.com', phone: '975335642', role: 1  , password: "123456"},
        { name: 'Admin', email: 'admin@mail.com', phone: '975325642', role: 1  , password: "123456"},
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
puts "Start seeding Field"
  6.times do
    fields = [
        {name: 'La Once',sport_type:'soccer', field_type: 'grass', capacity: 12,
        summary:'Esta es una cancha de grass ubicada en Los
        Angeles', price_hour: 16, published_at: '2021/11/06' ,
        address: 'Jr Los Angeles 367', user_id: 1,
        ubication_id:1},
        {name: 'All Sport',sport_type:'soccer', field_type: 'sintetic', capacity: 9,
        summary:'Esta es una canch.... ', price_hour: 35, published_at: '2021/10/31' ,
        address: 'Jr Los Angeles 367', user_id: 1,
        ubication_id:3},
        {name: 'Tu canchita',sport_type:'soccer', field_type: 'grass', capacity: 20,
        summary:'Esta es la cancha más grandede la region', price_hour: 50, published_at: '2021/11/03' ,
        address: 'Jr La Rosa 367', user_id: 3,
        ubication_id:4},
        {name: 'Tu pelotita',sport_type:'soccer', field_type: 'sintetic', capacity: 10,
        summary:'Esta es una.....', price_hour: 27, published_at: '2021/11/09' ,
        address: 'Av el sol 360', user_id: 3,
        ubication_id:5},
        {name: 'La ocho',sport_type:'tennis', field_type: 'arcilla', capacity: 4,
        summary:'Esta es una cancha de teennis muy comoda para jugar',
        price_hour: 50, published_at: '2021/07/26' ,
        address: 'Jr Ceramicas 7', user_id: 2,
        ubication_id:6},
        {name: 'La Diez',sport_type:'soccer', field_type: 'grass', capacity: 10,
        summary:'Esta es una cancha de ... s', price_hour: 16, published_at: '2021/11/06' ,
        address: 'Av Los Claveles 7', user_id: 2,
        ubication_id:1},
        {name: 'La catorce',sport_type:'tennis', field_type: 'arcilla', capacity: 4,
        summary:'Esta es una cancha de ...', price_hour: 40, published_at: '2021/05/02' ,
        address: 'Jr Barra brava 12', user_id: 2,
        ubication_id:3},
      ]
  Field.create(fields)
end
puts "End seeding Field"
puts "Start seeding Review"
  6.times do
    reviews = [
        {rating:4 , comment:"I like it", field_id:1},
        {rating:4 , comment:"Good", field_id:1},
        {rating:2 , comment:"i dont like it", field_id:6},
        {rating:5 , comment:"Excellent", field_id:5},
        {rating:2 , comment:"it has been a good place to play", field_id:6},
        {rating:3, comment:"it was good", field_id:2},
        {rating:1 , comment:"i didnt like it", field_id:2}
      ]
  Review.create(reviews)
end
puts "End seeding Reviews"
puts "Start seeding Field"
  6.times do
    fields = [
        {name: 'La Once',sport_type:'soccer', field_type: 'grass', capacity: 12,
        summary:'Esta es una cancha de grass ubicada en Los
        Angeles', price_hour: 16, published_at: '2021/11/06' ,
        address: 'Jr Los Angeles 367', user_id: 1,
        ubication_id:1},
        {name: 'All Sport',sport_type:'soccer', field_type: 'sintetic', capacity: 9,
        summary:'Esta es una canch.... ', price_hour: 35, published_at: '2021/10/31' ,
        address: 'Jr Los Angeles 367', user_id: 1,
        ubication_id:3},
        {name: 'Tu canchita',sport_type:'soccer', field_type: 'grass', capacity: 20,
        summary:'Esta es la cancha más grandede la region', price_hour: 50, published_at: '2021/11/03' ,
        address: 'Jr La Rosa 367', user_id: 3,
        ubication_id:4},
        {name: 'Tu pelotita',sport_type:'soccer', field_type: 'sintetic', capacity: 10,
        summary:'Esta es una.....', price_hour: 27, published_at: '2021/11/09' ,
        address: 'Av el sol 360', user_id: 3,
        ubication_id:5},
        {name: 'La ocho',sport_type:'tennis', field_type: 'arcilla', capacity: 4,
        summary:'Esta es una cancha de teennis muy comoda para jugar',
        price_hour: 50, published_at: '2021/07/26' ,
        address: 'Jr Ceramicas 7', user_id: 2,
        ubication_id:6},
        {name: 'La Diez',sport_type:'soccer', field_type: 'grass', capacity: 10,
        summary:'Esta es una cancha de ... s', price_hour: 16, published_at: '2021/11/06' ,
        address: 'Av Los Claveles 7', user_id: 2,
        ubication_id:1},
        {name: 'La catorce',sport_type:'tennis', field_type: 'arcilla', capacity: 4,
        summary:'Esta es una cancha de ...', price_hour: 40, published_at: '2021/05/02' ,
        address: 'Jr Barra brava 12', user_id: 2,
        ubication_id:3},
      ]
  Field.create(fields)
end
puts "End seeding Field"
puts "Start seeding Reservations"
users = User.all
fields = Field.all
fields.each do |field|
  total = 0
  rand(1..4).times do
    hours = rand(1..3)
    user = users.sample
    reservation_item_data = {
      start_date_hour: '2021/11/02',
      end_date_hour:'2021/12/02',
      total: (field.price_hour * hours),
      user: user,
      field: field
    }
    Reservation.create(reservation_item_data)
  end
end
puts "Finish seeding reservations"