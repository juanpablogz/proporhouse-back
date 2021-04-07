# == Schema Information
#
# Table name: countries
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Country, type: :model do
  describe 'creation' do
    it 'can be created' do
      country = Country.create!(name: 'colombia')
      expect(country).to be_valid
    end
    it 'if name is nil cannot be created' do
      country = Country.new(name: nil)
      expect(country).not_to be_valid
    end
    it 'if name is blank cannot be created' do
      country = Country.new(name: '')
      expect(country).not_to be_valid
    end
  end
end
