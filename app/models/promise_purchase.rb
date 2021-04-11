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
#
# Indexes
#
#  index_promise_purchases_on_offer_id  (offer_id)
#  index_promise_purchases_on_user_id   (user_id)
#
class PromisePurchase < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  validates :user_id, :offer_id, presence: true
  enum status_promise_purchase: { status_promise_purchase_undefined: 0,
                                  status_promise_purchase_progress: 1,
                                  status_promise_purchase_finished: 2,
                                  tatus_promise_purchase_purchase: 3 }
end
