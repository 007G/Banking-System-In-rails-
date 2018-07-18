class TransactionsController < ApplicationController

 def index
    @transactions = Transaction.all
 end
  
  def new
    @transaction = Transaction.new
  end

  def create
    @account_no = params[:transaction].values[0]
    amount = params[:transaction].values[1]
  
    from_account = current_user.account
    to_account = Account.find_by_account_no(@account_no)
     
    if benificiary_exist?
      to_account.update_columns(balance: (to_account.balance.to_i + amount.to_i))
      from_account.update_columns(balance: (from_account.balance.to_i - amount.to_i))

      Transaction.create!( user_id: current_user.id,account_no: to_account.id, amount: amount)
      UserMailer.transaction_done(current_user).deliver

      redirect_to transactions_path
    else
      redirect_to new_transaction_path
      flash[:notice] = "Please provide valid account number"
    end     
  end





end


 