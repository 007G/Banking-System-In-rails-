class TransactionPdf < Prawn::Document
  def initialize(transactions_details, user)
    super(top_margin: 20)
    @transactions = transactions_details
    @user = user
    content
    table_content
  end


    def content
    
     
    end
    

      def table_content
    # This makes a call to product_rows and gets back an array of data that will populate the columns and rows of a table
    # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
    # Then I set the table column widths
    table product_rows do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [40, 300, 200]
    end
  end

     def product_rows
    [['#', 'Amount']] +
      @transactions.map do |transaction|
      [transaction.id, transaction.amount]
    end
  end



end