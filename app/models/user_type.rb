class UserType < ActiveYaml::Base
  include ActiveHash::Associations
  has_many :users

end
