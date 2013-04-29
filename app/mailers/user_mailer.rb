class UserMailer < ActionMailer::Base
  default :from => 'makhnopub@gmail.com'

  def welcome(user, locale)
    @user = user
    @locale = locale
    @url = "http://makhnopub.com.ua"

    I18n.with_locale(locale) do
      mail(:to => user.email)
    end
  end

  def logged_in(user, locale)
    mail_to_admin user, locale, 'User logged in'
  end

  def logged_out(user, locale)
    mail_to_admin user, locale, 'User logged out'
  end

  private

  def mail_to_admin(user, locale, message)
    @user = user
    mail(:to => 'makhnopub@gmail.com', :subject => message)
  end
end
