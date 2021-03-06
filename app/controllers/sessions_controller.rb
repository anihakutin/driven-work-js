class SessionsController < ApplicationController
  def create
    if auth.present?
      @user = User.find_or_create_by_omniauth(auth["info"])
      if @user.valid?
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render :"users/new"
      end
    else
      @user = User.find_by(email: user_params[:email])
      if @user && @user.authenticate(user_params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:alert] = "Login Information Is Incorrect"
        redirect_to new_user_path
      end
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private
    def auth
      request.env['omniauth.auth']
    end

    def user_params
      params.require(:sessions).permit(:email, :password)
    end
end
