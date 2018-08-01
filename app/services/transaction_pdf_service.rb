class TransactionPdfService

  def initialize(user)
    @user = user
    @transactions_c = Transaction.where(account_id: @user.account.id)
    @transactions_d = @user.transactions
    @transactions = @transactions_c.or(@transactions_d).order("created_at")

  end

  def run
    pdf = TransactionPdf.new(@transactions, @user)
    pdf
  end

end
