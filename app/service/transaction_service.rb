class Test

  def initialize(user)
    @user = user
  end

  def run
    pdf = Prawn::Document.new
      pdf.text "Hello #{@user.last_name}"
      pdf.text "Email : #{@user.email}"
      pdf.text "Account No :#{@user.account.account_no}"
      pdf.text "Balance: #{@user.account.balance}"
  end
end
