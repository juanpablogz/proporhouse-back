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
class Offer < ApplicationRecord
  belongs_to :property
  belongs_to :user
  has_many :promise_purchases, dependent: :destroy
  validates :property_id, :user_id, :price, :expire, presence: true
  enum status_offer: { status_offer_role_undefined: 0, status_offer_in_progress: 1,
                       status_offer_finished: 2, status_offer_purchase: 3 }
end
