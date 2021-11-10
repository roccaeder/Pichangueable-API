User.destroy_all
Ubication.destroy_all
Field.destroy_all
# Review.destroy_all
Reservation.destroy_all
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
  2.times do
    fields = [
        { field_type: 'grass', capacity: 12,
        summary:'Esta es una cancha de grass ubicada en Los
        Angeles', price_hour: 16, published_at: '2021/11/06' ,
        address: 'Jr Los Angeles 367', user_id: 1,
        ubication_id:1},
        {field_type: 'sintetic', capacity: 9,
        summary:'Esta es una canch.... ', price_hour: 35, published_at: '2021/10/31' ,
        address: 'Jr Los Angeles 367', user_id: 1,
        ubication_id:3},  
      ]
  Field.create(fields)
end
puts "End seeding Field"
# puts "Start seeding Review"
#   6.times do
#     reviews = [
#         {rating:4 , comment:"I like it", field_id:1, user_id: 3},
#         {rating:4 , comment:"Good", field_id:1, user_id: 1},
#         {rating:2 , comment:"i dont like it", field_id:6, user_id: 2},
#         {rating:5 , comment:"Excellent", field_id:5, user_id: 3},
#         {rating:2 , comment:"it has been a good place to play", field_id:6, user_id: 1},
#         {rating:3, comment:"it was good", field_id:2, user_id: 2},
#         {rating:1 , comment:"i didnt like it", field_id:2, user_id: 3}
#       ]
#   Review.create(reviews)
# end
puts "End seeding Reviews"
puts "Start seeding Reservations"
users = User.all
fields = Field.all
fields.each do |field|
  rand(1..4).times do
    user = users.sample
    reservation_item_data = {
      start_date_hour: '2021/12/02 16:00:00',
      end_date_hour:'2021/12/02 17:00:00',
      total: field.price_hour,
      user: user,
      field: field
    }
    total = ((DateTime.parse(reservation_item_data[:end_date_hour])-DateTime.parse(reservation_item_data[:start_date_hour]))/3600)*reservation_item_data[:total]
    reservation_item_data[:total] = total
    Reservation.create(reservation_item_data)
  end
end
puts "Finish seeding reservations"