class Transaction < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :account,  optional: true

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
