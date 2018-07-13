class Transaction < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :account,  optional: true
end
