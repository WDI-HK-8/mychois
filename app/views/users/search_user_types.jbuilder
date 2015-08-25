json.array! @users do |user|
  json.id         user.id
  json.name       user.name
  json.email      user.email
  json.district   user.district.name
end