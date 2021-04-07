# == Schema Information
#
# Table name: departments
#
#  id         :bigint           not null, primary key
#  country_id :bigint           not null
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_departments_on_country_id  (country_id)
#
require 'rails_helper'

RSpec.describe Department, type: :model do
  describe 'creation' do
    it 'can be created' do
      country = Country.create!(name: 'colombia')
      department = Department.create!(country_id: country.id, name: 'antioquia')
      expect(department).to be_valid
    end
    it 'if country not exist cannot create' do
      department = Department.new(name: 'antioquia')
      expect(department).not_to be_valid
    end
    it 'if name is nil cannot be created' do
      department = Department.new(name: nil)
      expect(department).not_to be_valid
    end
    it 'if name is nil cannot be created' do
      department = Department.new(name: '')
      expect(department).not_to be_valid
    end
  end
end
