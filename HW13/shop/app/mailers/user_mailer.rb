class UserMailer < ApplicationMailer
  def order_confirmation(user)
    @user = user

    mail(to: @user.email, subject: 'Order confirmation')
  end
end
