class ProductMailer < ActionMailer::Base
  default :from => 'makhnopub@gmail.com'

  def clear_products(user, locale)
    @user = user
    @locale = locale
    @products = Product.all

    I18n.with_locale(locale) do
      mail(:to => 'makhnopub@gmail.com')
    end
  end
end
