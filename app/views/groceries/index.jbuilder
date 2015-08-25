json.array! @groceries do |grocery|
  json.id     grocery.id
  json.name   grocery.name
  json.price  grocery.price
end