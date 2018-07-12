class TransactionsController < ApplicationController

  def index

  end
  
  def new
    @transaction = Transaction.new
  end

  def create
      @account_no = params[:transaction].values[0]
      amount = params[:transaction].values[1]

      from_account = current_user.account
      to_account = Account.find_by_account_no(@account_no)

      to_account.update_columns(balance: (to_account.balance.to_i + amount.to_i))
      from_account.update_columns(balance: (from_account.balance.to_i - amount.to_i))
      Transaction.create!(account_id: to_account.id, user_id: current_user.id, amount: amount)

  end

end
