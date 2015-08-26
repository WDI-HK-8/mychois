class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable    
  include DeviseTokenAuth::Concerns::User
  validates :district_id, presence: true

  has_many :grocery_lists
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :district
end
