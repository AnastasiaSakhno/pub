module Api
  class SessionsController < ApiController
    skip_before_filter :authenticate!

    def create
      user = User.find_by_email(auth_params[:email])
      if user.valid_password?(auth_params[:password])
        token = JwtService.encode(email: user.email, id: user.id)
        render json: { token: token }
      else
        fail! error_message: 'Wrong credentials', status: 403
      end
    end

    private

    def auth_params
      params.require(:user).permit(:email, :password)
    end
  end
end