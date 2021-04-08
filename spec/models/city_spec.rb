# == Schema Information
#
# Table name: cities
#
#  id            :bigint           not null, primary key
#  department_id :bigint           not null
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_cities_on_department_id  (department_id)
#
require 'rails_helper'

RSpec.describe City, type: :model do
  describe 'creation' do
    it 'can be created' do
      country = Country.create!(name: 'colombia')
      department = Department.create!(country_id: country.id, name: 'antioquia')
      city = City.create!(department_id: department.id, name: 'medellin')
      expect(city).to be_valid
    end
    it 'if department not exist cannot be created' do
      city = Department.new(name: 'medellin')
      expect(city).not_to be_valid
    end
    it 'if name is nil cannot be created' do
      country = Country.create!(name: 'colombia')
      department = Department.create!(country_id: country.id, name: 'antioquia')
      city = City.new(department_id: department.id, name: nil)
      expect(city).not_to be_valid
    end
    it 'if name is blank cannot be created' do
      country = Country.create!(name: 'colombia')
      department = Department.create!(country_id: country.id, name: 'antioquia')
      city = City.new(department_id: department.id, name: '')
      expect(city).not_to be_valid
    end
  end
end
