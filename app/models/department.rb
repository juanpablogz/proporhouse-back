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
class Department < ApplicationRecord
  belongs_to :country
  has_many :cities, dependent: :destroy
end
