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
     
      redirect_to transactions_path
    else
      redirect_to new_transaction_path
      flash[:notice] = "Please provide valid account number"
    end     
  end

  def benificiary_exist?
    current_user.benificiaries.where(account_no: @account_no).first
  end


    def download_mini_statement
    index
    respond_to do |format|
      format.html
      format.pdf do
        pdf = TransactionPdf.new(@transactions, current_user)

        send_data pdf.render,
                  filename: "Ministatement_#{ current_user.first_name }.pdf",
                  type: 'application/pdf',
                  disposition: 'inline'
      end
    end
end




end


 