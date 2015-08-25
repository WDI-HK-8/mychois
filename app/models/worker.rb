class Worker < User
  devise :database_authenticatable, :timeoutable

end
