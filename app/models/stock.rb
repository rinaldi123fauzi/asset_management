class Stock < ApplicationRecord
  belongs_to :software
  belongs_to :tool
end
