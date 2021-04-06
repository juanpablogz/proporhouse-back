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
FactoryBot.define do
  factory :property do
    neighborhood { nil }
    user { nil }
    address { "MyString" }
    lat { 1.5 }
    lgn { 1.5 }
  end
end
