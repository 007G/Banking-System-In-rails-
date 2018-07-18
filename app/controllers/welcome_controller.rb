class WelcomeController < ApplicationController
  def index
  @users = User.all
  @address = Address.all
  end

end
