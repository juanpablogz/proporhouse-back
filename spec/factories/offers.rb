# == Schema Information
#
# Table name: offers
#
#  id           :bigint           not null, primary key
#  property_id  :bigint           not null
#  user_id      :bigint           not null
#  price        :float
#  expire       :date
#  status_offer :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_offers_on_property_id  (property_id)
#  index_offers_on_user_id      (user_id)
#
FactoryBot.define do
  factory :offer do
    property { nil }
    user { nil }
    price { 1.5 }
    expires { "2021-04-06" }
    status_offer { 1 }
  end
end
