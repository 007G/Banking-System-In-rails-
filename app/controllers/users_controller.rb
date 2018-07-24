class UsersController < ApplicationController
  def verify
     @user = User.find(params[:id])
     @user.update_columns(verify: true)
     
     redirect_to welcome_index_path
   end
  

end
