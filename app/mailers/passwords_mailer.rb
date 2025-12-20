class PasswordsMailer < ApplicationMailer
  def reset(user)
    @user = user
    mail subject: "パスワードをリセット", to: user.email_address
  end
end
