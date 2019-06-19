class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by_omniauth(auth["info"])
    session[:user_id] = user.id
    @auth = auth
  end

  private
    def auth
      request.env['omniauth.auth']
    end
end
