truck = Truck.create(name: "First Truck", email: "truck@email.com", password: "123123", zipcode: 11233)
flavor1 = Flavor.create(name: "Chocolate")
flavor2 = Flavor.create(name: "Vanilla")
icecream = truck.icecreams.create(name: "First Icecream", price: 6.25)
icecream.flavor_ids = [1,2]
icecream.save
customer = Customer.create(name: "Ogulcan S.", email: "customer@email.com", password: "123123", zipcode: 11233, wallet: 20)
order = Order.create(items: "2 First Icecream", truck_id: 1, customer_id: 1)
