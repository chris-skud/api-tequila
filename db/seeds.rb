# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

producers = Producer.create([
    { name: 'Producer 1', nom: '2352', dot: '123', address: '23kljd Mexico', telephone: '232423423'},
    { name: 'Producer 2', nom: '2341', dot: '116', address: 'Jalisco', telephone: '999923423'}
])

Brand.create(name: 'Don Julio', producer: producers.first)
Brand.create(name: 'El Jimador', producer: producers.first)
Brand.create(name: 'Herradura', producer: producers.second)
Brand.create(name: 'Corazon', producer: producers.second)

Product.create(name: 'Blanco', style: 'blanco', brand: Brand.first)
Product.create(name: 'Blanco', style: 'blanco', brand: Brand.second)
Product.create(name: 'Blanco', style: 'blanco', brand: Brand.third)
Product.create(name: 'Blanco', style: 'blanco', brand: Brand.fourth)
