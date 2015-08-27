json.id                   @grocery_list.id
json.name                 @grocery_list.name
json.additional_comments  @grocery_list.additional_comments
json.substitutions        @grocery_list.substitutions
json.grocery_list_items   @grocery_list.grocery_list_items
json.total                @grocery_list.grocery_list_items.sum(:total_price)
