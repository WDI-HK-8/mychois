json.array! @groceries do |grocery|
  json.id     grocery.id
  json.name   grocery.name
  json.price  grocery.price
  json.sale_price grocery.sale_price unless grocery.sale_price.nil?
end
