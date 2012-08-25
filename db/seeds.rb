# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development? # ???

	Faker::Config.locale = :en

	User.destroy_all
	Product.destroy_all

	cereals = ['Cereals',
						 'corn',
						 'rice',
						 'wheat',
						 'oats']

	veggies = ['Vegetables/Melons',
					 	 'broccoli',
						 'lettuce',
						 'spinach',
						 'asparagus',
						 'pumpkin']

	roots = ['Roots/Tubers',
					 'carrots',
					 'potatoes',
					 'beets',
					 'onions']

	milk = ['Milk',
					'whole milk',
					'butter',
					'yogurt',
					'chocolate milk']

	fruit = ['Fruit',
					 'oranges',
					 'red apples',
					 'green apples',
					 'figs']

	meat = ['Meat',
					'steak',
					'chicken',
					'pig',
					'rabbit']

	fish = ['Fish',
					'salmon',
					'tuna',
					'grouper',
					'clams']

	eggs = ['Eggs',
					'grade AA',
					'grade A',
					'grade B']

	legumes = ['Legumes',
						 'alfalfa',
						 'peas',
						 'lentils',
						 'peanuts']

	product_cats = [cereals,veggies,roots,milk,
									fruit,meat,fish,eggs,legumes]

	packaging = ['crate','bushel','barrel','pallet','bag']
	unit = ['ea','lb','oz','dozen']

	puts "Creating Users..."
	num = 0
	4.times do |u|
		u = User.new
		u.email =					Faker::Internet.email
		u.password = 			"pw#{num}"
		u.password_confirmation =  "pw#{num}"
		u.first_name =		Faker::Name.first_name
		u.last_name =	 	  Faker::Name.last_name
		u.business_name =	Faker::Company.name
		u.address =				Faker::Address.street_address
		u.city =					Faker::Address.city
		u.state =					Faker::Address.state
		u.zip =						Faker::Address.zip
		u.website = 			Faker::Internet.url
		u.phone = 				Faker::PhoneNumber.cell_phone
		u.about =					Faker::Lorem.sentences(3)
		if num%2 == 0
			u.business = 		"Farm"
		else u.business =	"Restaurant"
		end
		u.tag = 					Faker::Company.bs
		u.save
		num+=1
	end

	puts "Creating Products..."
	u = User.all
	u.size.times do |pf|
		4.times do |p|
			ptype = rand(product_cats.size)
			pname = rand(product_cats[ptype].size-1)+1
			p = Product.new
			p.name = 							product_cats[ptype][pname]
			p.product_attribute = product_cats[ptype][0]
			p.description =				Faker::Lorem.sentences(1)
			p.packaging = 				packaging[rand(packaging.size)]
			p.uom =								unit[rand(unit.size)]
			p.price =							rand(1000).to_f/100
			p.qty_avail =					rand(200)
			p.user_id =						u[pf/2].id
			dd = rand(2)
			if dd == 1
				p.created_at = 			Time.now
			else p.created_at =		Time.now-7.days
			end
			p.save
		end
	end
end