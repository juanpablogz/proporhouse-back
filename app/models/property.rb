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
class Property < ApplicationRecord
  belongs_to :neighborhood
  belongs_to :user
  has_many :offers, dependent: :destroy
end
