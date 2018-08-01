class TransactionsController < ApplicationController

  before_action :redirect_to_root, only: [:index]

  def index
   @transactions_c = Transaction.where(account_id: current_user.account.id)
   @transactions_d = current_user.transactions
   @transactions = @transactions_c.or(@transactions_d).order("created_at")
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
      to_account.update(balance: (to_account.balance.to_i + amount.to_i))
      from_account.update(balance: (from_account.balance.to_i - amount.to_i))

      Transaction.create!( user_id: current_user.id,account_no: to_account.id, amount: amount)
      redirect_to transactions_path
      else
        flash[:notice] = "Please provide valid account number"
        redirect_to new_transaction_path
      end     
  end

  def d_mini_statement
    pdf_file = TransactionPdfService.new(current_user).run
    respond_to do |format|
    format.html
    format.pdf do

    send_data pdf_file.render,
                  filename: "Ministatement_#{ current_user.first_name }.pdf",
                  type: 'application/pdf',
                  disposition: 'inline'
         end
       end
  end

  def benificiary_exist?
   current_user.benificiaries.where(account_no: @account_no).first
  end



  def download_mini_statement
   pdf_file = TransactionService.new(current_user).run
   respond_to do |format|
   format.html
   format.pdf do
   #pdf = Prawn::Document.new 

      
   send_data pdf_file.render,
                  filename: "transaction.pdf",
                  type: 'application/pdf',
                  disposition: 'inline'
       end
     end
  end
   

end




 