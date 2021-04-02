truck = Truck.create(name: "First Truck", email: "truck@email.com", password: "123123", zipcode: 11233)
truck2 = Truck.create(name: "Ramos Truck", email: "truck2@email.com", password: "123123", zipcode: 12345)
customer = Customer.create(name: "Ogulcan S.", email: "customer@email.com", password: "123123", zipcode: 11233)
customer2 = Customer.create(name: "Fasharra B.", email: "customer2@email.com", password: "123123", zipcode: 12345)

flavors = [
    "Menu",
    "Chocolate",
    "Vanilla",
    "Caramel",
    "Lemon",
    "Pistachio",
    "Melon",
    "Strawberry"
]

flavors.each {|f| Flavor.create(name: f)}

i1 = Icecream.create(name: "Royal", price: 9.0, truck_id: 1, flavor_ids: [1,2,3]),
i2 = Icecream.create(name: "Valentine", price: 7.5, truck_id: 1, flavor_ids: [1,7]),
i3 = Icecream.create(name: "Wondermelon", price: 8.0, truck_id: 2, flavor_ids: [6]),
i4 = Icecream.create(name: "Best in NY", price: 11.0, truck_id: 1, flavor_ids: [5,2])

 


