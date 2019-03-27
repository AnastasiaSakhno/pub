module Api
  class ApiController < ApplicationController
    before_filter :authenticate!

    def authenticate!
      payload = JwtService.decode(token)
      user = User.find_for_authentication(email: payload['email'])
      user if user.valid_password?(params[:password])
    rescue ::JWT::ExpiredSignature
      fail! error_message: 'Auth token has expired. Please login again', status: 401
    rescue ::JWT::DecodeError
      fail! error_message: 'Auth token is invalid', status: 401
    rescue
      fail! error_message: 'Undefined error', status: 401
    end

    def fail!(attrs)
      render json: { error_message: attrs[:error_message] }, status: attrs[:status]
    end

    private

    def token
      (request.headers['Authorization'] || '').split(' ').last
    end
  end
end