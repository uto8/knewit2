class Truck < ApplicationRecord
  has_many :delivery_contents
  enum carrier: { wing: 0, body: 1 }
end
