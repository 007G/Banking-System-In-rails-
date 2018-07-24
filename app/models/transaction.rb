class Transaction < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :account,  optional: true

  validates :account_no, numericality: { only_integer: true }
  validates :amount, numericality: { only_integer: true }



  

end













