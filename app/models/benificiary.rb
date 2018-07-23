class Benificiary < ApplicationRecord
   has_and_belongs_to_many :users

  validates :account_no, numericality: { only_integer: true }
  validates :first_name, presence: true
  validates :last_name, presence: true 


end
