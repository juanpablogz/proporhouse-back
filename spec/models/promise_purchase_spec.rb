# == Schema Information
#
# Table name: promise_purchases
#
#  id                      :bigint           not null, primary key
#  user_id                 :bigint           not null
#  offer_id                :bigint           not null
#  status_promise_purchase :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  active                  :boolean
#
# Indexes
#
#  index_promise_purchases_on_offer_id  (offer_id)
#  index_promise_purchases_on_user_id   (user_id)
#
require 'rails_helper'

RSpec.describe PromisePurchase, type: :model do
  it 'can be created' do
    user = User.create!(email: 'admin@example.com', password: 'password')
    country = Country.create!(name: 'colombia')
    department = Department.create!(country_id: country.id, name: 'antioquia')
    city = City.create!(department_id: department.id, name: 'medellin')
    neighborhood = Neighborhood.create!(city_id: city.id, name: 'belen')
    property = Property.create!(neighborhood_id: neighborhood.id, user_id: user.id,
                                address: 'calle 10 norte')
    offer = Offer.create!(property_id: property.id, user_id: user.id, price: 1000,
                          expire: Time.zone.now + 5.days)
    promise_purchase = PromisePurchase.create!(user_id: user.id, offer_id: offer.id)
    expect(promise_purchase).to be_valid
  end
  it 'if user not exist cannot be created' do
    user = User.create!(email: 'admin@example.com', password: 'password')
    country = Country.create!(name: 'colombia')
    department = Department.create!(country_id: country.id, name: 'antioquia')
    city = City.create!(department_id: department.id, name: 'medellin')
    neighborhood = Neighborhood.create!(city_id: city.id, name: 'belen')
    property = Property.create!(neighborhood_id: neighborhood.id, user_id: user.id,
                                address: 'calle 10 norte')
    offer = Offer.create!(property_id: property.id, user_id: user.id, price: 1000,
                          expire: Time.zone.now + 5.days)
    promise_purchase = PromisePurchase.new(offer_id: offer.id)
    expect(promise_purchase).not_to be_valid
  end
  it 'if offer not exist cannot be created' do
    user = User.create!(email: 'admin@example.com', password: 'password')
    promise_purchase = PromisePurchase.new(user_id: user.id)
    expect(promise_purchase).not_to be_valid
  end
end
