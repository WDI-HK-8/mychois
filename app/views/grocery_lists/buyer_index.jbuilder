json.array! @grocery_lists do |grocery_list|
  json.id             grocery_list.id
  json.name           grocery_list.name
  json.customer_name  User.find(grocery_list.customer_id).name
  json.customer_address User.find(grocery_list.customer_id).address
  json.customer_district User.find(grocery_list.customer_id).district.name
  json.worker_id      grocery_list.worker_id
  json.comments       grocery_list.additional_comments
  json.substitutions  grocery_list.substitutions
end