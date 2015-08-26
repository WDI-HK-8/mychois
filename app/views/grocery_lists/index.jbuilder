json.array! @grocery_lists do |grocery_list|
  json.id     grocery_list.id
  json.name     grocery_list.name
  json.customer_id  grocery_list.customer_id
  json.comments   grocery_list.additional_comments
  json.substitutions   grocery_list.substitutions
end
