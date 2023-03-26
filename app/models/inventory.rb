class Inventory < ApplicationRecord
  has_many :loan
  belongs_to :item
  belongs_to :user, optional: true
  has_many_attached :foto_inventory
end
