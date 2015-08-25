class Customer < User
  devise :database_authenticatable, :timeoutable
end
