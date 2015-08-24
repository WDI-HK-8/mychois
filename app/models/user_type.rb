class UserType < ActiveYaml::Base
  include ActiveHash::Associations
  set_root_path "config/models"
  has_many :users

end
