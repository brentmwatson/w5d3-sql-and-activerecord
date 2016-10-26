# README
How many users are there?
`User.count`
51

What are the 5 most expensive items?
`Items.order(price: :desc).limit(5).pluck(:title,:price)`
"Small Cotton Gloves", 9984], ["Small Wooden Computer", 9859], ["Awesome Granite Pants", 9790], ["Sleek Wooden Hat", 9390], ["Ergonomic Steel Car", 9341

What's the cheapest book?
`Item.where(category:"Books").order(:price).limit(1)`

Who lives at "6439 Zetta Hills, Willmouth, WY"? Do they have another address?
`User.joins(:addresses).find_by("addresses.street = '6439 Zetta Hills'")`

`Address.joins(:user).where("users.first_name ='Corrine'","users.last_name ='Little'")`

Correct Virginie Mitchell's address to "New York, NY, 10108".
`Address.joins(:user).where("users.first_name ='Virginie'","users.last_name ='Mitchell'").update_all(city: "New York",state:"NY",zip:"10108")`

How much would it cost to buy one of each tool?
`Item.where('category LIKE ?', '%tool%').sum(:price)`
46477

How many total items did we sell?
` Order.sum(:quantity)`
2126

How much was spent on books?
`Order.joins(:item).where('category LIKE ?', '%book%').sum("items.price*orders.quantity")`
1090693

Simulate buying an item by inserting a User for yourself and an Order for that User.
`User.create(first_name:"Janice",last_name:"Watson",email:"jbtwatson@aol.com")`

commit transaction
=> #<User id: 52, first_name: "Janice", last_name: "Watson", email: "jbtwatson@aol.com">

`Order.create(user_id:"52",item_id:"66", quantity:"1")`

commit transaction
=> #<Order id: 379, user_id: 52, item_id: 66, quantity: 1, created_at: "2016-10-26 00:43:52">
