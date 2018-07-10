class WelcomeController < ApplicationController
  def index
  @user = User.paginate(:page => params[:page], :per_page => 7)
  end

  def show
  @user = User.find(params[:id])
  end 
end
