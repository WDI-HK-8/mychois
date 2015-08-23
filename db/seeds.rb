# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
districts = ['Central',
             'Wan Chai',    
             'Sham Shui Po',
             'Kowloon City',
             'Kwun Tong',
             'Wong Tai Sin', 
             'Yau Tsim Mong',
             'Kwai Tsing',
             'North Point',
             'Sai Kung',
             'Sha Tin',
             'Tai Po',
             'Tsuen Wan', 
             'Tuen Mun',
             'Yuen Long'
            ]

usertypes = ['Shopper',
             'Customer'
            ]
districts.each do |district|
  District.where(name: district).first_or_create(name: district)
end

usertypes.each do |usertype|
  UserType.where(name: usertype).first_or_create(name: usertype)
end
