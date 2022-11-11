class DeliveryContent < ApplicationRecord
  belongs_to :user
  belongs_to :truck
  has_many :delivery_roots
  has_many :delivery_loads
end
