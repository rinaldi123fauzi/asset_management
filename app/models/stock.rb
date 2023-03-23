class Stock < ApplicationRecord
  belongs_to :software, optional: :true
  belongs_to :tool, optional: :true
end
