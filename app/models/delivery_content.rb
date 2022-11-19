class DeliveryContent < ApplicationRecord
  belongs_to :user
  belongs_to :truck
  belongs_to :delivery_destination
  has_many :loads
end
