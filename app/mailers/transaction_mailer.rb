  def amount_deducted(user, amount)
    @user = user
    @amount = amount

    mail(to: @user.email, subject: "Amount Deducted From your account")
  end

  def amount_credited(user, amount)
    @user = user
    @amount = amount

    mail(to: @user.email, subject: "Amount credited to your account")
  end