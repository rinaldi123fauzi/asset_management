class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :software
  belongs_to :tool
end
