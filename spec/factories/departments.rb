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
FactoryBot.define do
  factory :department do
    country { nil }
    name { "MyString" }
  end
end
