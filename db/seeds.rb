truck = Truck.create(name: "First Truck", email: "truck@email.com", password: "123123", zipcode: 11233)
flavor1 = Flavor.create(name: "Chocolate")
flavor2 = Flavor.create(name: "Vanilla")
icecream1 = truck.icecreams.create(name: "First Icecream", price: 6.25)
icecream1.flavor_ids = [1,2]
icecream1.save
icecream2 = truck.icecreams.create(name: "Royal", price: 8.25)
icecream2.flavor_ids = [2]
icecream2.save
customer = Customer.create(name: "Ogulcan S.", email: "customer@email.com", password: "123123", zipcode: 11233)
