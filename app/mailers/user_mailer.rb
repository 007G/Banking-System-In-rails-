class UserMailer < ApplicationMailer
   
  #default from: 'gaurav774466@gmail.com'

  
  def verify_user(user)
    @user = user
    @url = "http://localhost:3000/welcome/index"
    
    mail(to: @user.email, subject: "Welcome to Banking System")
  end  

end
