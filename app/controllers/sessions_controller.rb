class SessionsController < ApplicationController
  def create
    if auth.present?
      user = User.find_or_create_by_omniauth(auth["info"])
      session[:user_id] = user.id
      @user = current_user
      redirect_to user_path(@user)
    else
      user = User.find_by(email: user_params[:email])
      if user && user.authenticate(user_params[:password])
        session[:user_id] = user.id
        @user = current_user
        redirect_to user_path(@user)
      else
        flash[:alert] = "Login Information Incorrect"
        redirect_to root_path
      end
    end
  end

  def destroy
    session.clear
  end

  private
    def auth
      request.env['omniauth.auth']
    end

    def user_params
      params.require(:session).permit(:email, :password)
    end
end
