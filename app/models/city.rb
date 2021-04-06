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
class City < ApplicationRecord
  belongs_to :department
  has_many :neighborhoods
end
