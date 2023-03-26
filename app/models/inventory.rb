class Inventory < ApplicationRecord
  belongs_to :item
  belongs_to :user, optional: true
  has_many_attached :foto_inventory
end
