# == Schema Information
#
# Table name: neighborhoods
#
#  id         :bigint           not null, primary key
#  city_id    :bigint           not null
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_neighborhoods_on_city_id  (city_id)
#
require 'rails_helper'

RSpec.describe Neighborhood, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
