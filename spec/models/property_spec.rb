# == Schema Information
#
# Table name: properties
#
#  id              :bigint           not null, primary key
#  neighborhood_id :bigint           not null
#  user_id         :bigint           not null
#  address         :string
#  lat             :float
#  lng             :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_properties_on_neighborhood_id  (neighborhood_id)
#  index_properties_on_user_id          (user_id)
#
require 'rails_helper'

RSpec.describe Property, type: :model do
  describe 'creation' do
    it 'can be created' do
      country = Country.create!(name: 'colombia')
      department = Department.create!(country_id: country.id, name: 'antioquia')
      city = City.create!(department_id: department.id, name: 'medellin')
      neighborhood = Neighborhood.create!(city_id: city.id, name: 'belen')
      user = User.create!(email: 'admin@example.com', password: 'password')
      property = Property.create!(neighborhood_id: neighborhood.id, user_id: user.id,
                                  address: 'calle 10 norte')
      expect(property).to be_valid
    end
    it 'if country not exist cannot be created' do
      user = User.create!(email: 'admin@example.com', password: 'password')
      property = Property.new(user_id: user.id, address: 'calle 10 norte')
      expect(property).not_to be_valid
    end
    it 'if user not exist cannot be created' do
      country = Country.create!(name: 'colombia')
      department = Department.create!(country_id: country.id, name: 'antioquia')
      city = City.create!(department_id: department.id, name: 'medellin')
      neighborhood = Neighborhood.create!(city_id: city.id, name: 'belen')
      property = Property.new(neighborhood_id: neighborhood.id, address: 'calle 10 norte')
      expect(property).not_to be_valid
    end
    it 'if address not exist cannot be created' do
      country = Country.create!(name: 'colombia')
      department = Department.create!(country_id: country.id, name: 'antioquia')
      city = City.create!(department_id: department.id, name: 'medellin')
      neighborhood = Neighborhood.create!(city_id: city.id, name: 'belen')
      user = User.create!(email: 'admin@example.com', password: 'password')
      property = Property.new(neighborhood_id: neighborhood.id, user_id: user.id)
      expect(property).not_to be_valid
    end
  end
end
