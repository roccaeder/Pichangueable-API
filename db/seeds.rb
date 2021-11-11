User.destroy_all
Ubication.destroy_all
Field.destroy_all
Review.destroy_all
Reservation.destroy_all
users = [
        { name: 'Natz', email: 'natz@mail.com', phone: '975318642', role: 1 , password: "123456"},
        { name: 'Aldo', email: 'aldo@mail.com', phone: '975335642', role: 1  , password: "123456"},
        { name: 'Admin', email: 'admin@mail.com', phone: '975325642', role: 1  , password: "123456"},
        { name: 'Ana', email: 'anita@mail.com', phone: '971218642', role: 0 , password: "123456"},
        { name: 'Rodrigo', email: 'rodri@mail.com', phone: '975312332', role: 0  , password: "123456"},
        { name: 'Edder', email: 'eder@mail.com', phone: '911112222', role: 0 , password: "123456"}
      ]
puts "Start seeding Users"
users.each do |user|
  User.create(user)
end
puts "End seeding Users"
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
puts "Start seeding Ubication"
ubications.each do |ubication|
  Ubication.create(ubication)
end
puts "End seeding Users"
fields = [
        {name: 'Full vaso',sport_type:'soccer', field_type: 'grass', capacity: 12,
        summary:'Esta es una cancha de grass ubicada en Los
        Angeles', price_hour: 16, published_at:  rand(4.week.ago..Time.now),
        address: 'Jr Los Angeles 367', images: ["cancha1.jpg", "cancha2.jpg"]},
        {name: 'All Sport',sport_type:'soccer', field_type: 'sintetic', capacity: 9,
        summary:'Esta es una canch.... ', price_hour: 35, published_at: rand(4.week.ago..Time.now) ,
        address: 'Jr Los Angeles 367', images: ["cancha3.jpg", "cancha4.jpg", "cancha55.jpg"]},
        {name: 'Tu canchita',sport_type:'soccer', field_type: 'grass', capacity: 20,
        summary:'Esta es la cancha más grandede la region', price_hour: 50, published_at: rand(4.week.ago..Time.now) ,
        address: 'Jr La Rosa 367', images: ["cancha5.jpg", "cancha6.jpg", "cancha7.jpg"]},
        {name: 'Tu pelotita',sport_type:'soccer', field_type: 'sintetic', capacity: 10,
        summary:'Esta es una.....', price_hour: 27, published_at: rand(4.week.ago..Time.now),
        address: 'Av el sol 360', images: [ "cancha11.jpg", "cancha8.jpg"]},
        {name: 'La Once',sport_type:'tennis', field_type: 'arcilla', capacity: 4,
        summary:'Esta es una cancha de teennis muy comoda para jugar',
        price_hour: 50, published_at: rand(4.week.ago..Time.now) ,
        address: 'Jr Ceramicas 7', images: ["tenis1.jpg", "tenis2.jpg", "tenis3.jpg"]},
        {name: 'La Diez',sport_type:'soccer', field_type: 'grass', capacity: 10,
        summary:'Esta es una cancha de ... s', price_hour: 16, published_at: rand(4.week.ago..Time.now) ,
        address: 'Av Los Claveles 7', images: ["cancha33.jpg", "cancha44.jpg", "cancha88.jpg"]},
        {name: 'La catorce',sport_type:'tennis', field_type: 'arcilla', capacity: 4,
        summary:'Esta es una cancha de ...', price_hour: 40, published_at: rand(4.week.ago..Time.now) ,
        address: 'Jr Barra brava 12', images: ["tenis4.jpg", "tenis5.jpg"]}]
users=User.all
ubications = Ubication.all
puts "Start seeding Field"
  fields.each do |field|
    user = users.sample
    ubication = ubications.sample
    field_item_data =
    {
      name: field[:name],
     sport_type: field[:sport_type],
     field_type:  field[:field_type],
     capacity: field[:capacity],
     summary: field[:summary],
     price_hour: field[:price_hour],
     published_at: field[:published_at],
     address: field[:address],
     user: user,
     ubication: ubication
    }
    p = Field.create(field_item_data)
    field[:images].each do |image|
      p.images.attach(io: File.open(Rails.root.join("app/assets/images/#{image}")), filename: "#{image}")
    end
  end
puts "End seeding Field"
users=User.all
fields = Field.all
reviews = [
  {rating:4 , comment:"I like it"},
  {rating:4 , comment:"Good"},
  {rating:2 , comment:"i dont like it"},
  {rating:5 , comment:"Excellent"},
  {rating:2 , comment:"it has been a good place to play"},
  {rating:3, comment:"it was good"},
  {rating:1 , comment:"i didnt like it"}
]
puts "Start seeding Review"
  reviews.each do |review|
    user = users.sample
    field = fields.sample
    review_item_data =
    {comment: review[:comment],
    rating: review[:rating],
     user: user,
     field: field
     }
    Review.create(review_item_data)
  end
puts "End seeding Review"
puts "Start seeding Reservations"
users = User.all
fields = Field.all
users.each do |user|
  rand(1..4).times do
    hour_start= rand(1.week.ago..Time.now)
    hour_time =  rand(1...5)
    hour_end = hour_start + hour_time.hours
    field = fields.sample
    start_date_hour=  DateTime.civil(hour_start.year, hour_start.month,hour_start.day,hour_start.hour, 0,0,0)
    end_date_hour=DateTime.civil(hour_end.year, hour_end.month,hour_end.day,hour_end.hour, 0,0,0)
    reservation_item_data = {
      start_date_hour:start_date_hour,
      end_date_hour: end_date_hour,
      total: hour_time * field.price_hour,
      user: user,
      field: field
    }
    Reservation.create(reservation_item_data)
  end
end
puts "Finish seeding reservations"