class Loan < ApplicationRecord
  belongs_to :inventory
  belongs_to :user
  belongs_to :software, optional: :true
  belongs_to :tool, optional: :true
end
