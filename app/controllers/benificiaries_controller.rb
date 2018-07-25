class BenificiariesController < ApplicationController
  before_action :redirect_to_root, only: [:index]


  def index
    @benificiaries = current_user.benificiaries
  end

  def new
     @benificiary = Benificiary.new
  end

  def create
    account_no = params[:benificiary].values[0]
    account = Account.find_by_account_no(account_no)
    
    if account && account.user.verify && account != current_user.account
      Benificiary.create(benificiary_params)
      UserMailer.benificiary_added(current_user).deliver
      current_user.benificiaries << Benificiary.last
      redirect_to  benificiaries_path
    else
      redirect_to new_benificiary_path
      flash[:notice] = "Please provide valid account number"
    end
  end



  private

  def benificiary_params
    params.require(:benificiary).permit(:first_name, :last_name, :account_no).merge(user_id: current_user.id)
  end

  def redirect_to_root
   if  !current_user.verify
       redirect_to root_path
   end
  end



end  
  



