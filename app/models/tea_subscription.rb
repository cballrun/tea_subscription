class TeaSubscription < ApplicationRecord
  belongs_to :tea, :class_name "Tea"
  belongs_to :subscription, :class_name "Subscription"
end