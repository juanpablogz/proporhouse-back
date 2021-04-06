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
require 'rails_helper'

RSpec.describe Offer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
