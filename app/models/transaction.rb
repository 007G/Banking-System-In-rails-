class Transaction < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :account,  optional: true



  def benificiary_exist?
    current_user.benificiaries.where(account_no: @account_no).first
  end

  

end













