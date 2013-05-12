class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  def set_locale
    session[:locale] = params[:locale] if params[:locale]
    I18n.locale = session[:locale] || I18n.default_locale
  end

  Warden::Manager.after_authentication do |user, auth, opts|
    UserMailer.logged_in(user, I18n.locale).deliver if user.manager?
  end

  Warden::Manager.before_logout do |user, auth, opts|
    UserMailer.logged_out(user, I18n.locale).deliver if user.manager?
  end
end
