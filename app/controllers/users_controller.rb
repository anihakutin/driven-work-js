class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :show, :new, :create]

  def new
    if logged_in?
      redirect_to root_path
    end

    @user = User.new
  end

  def create
    redirect_to root_path if logged_in?

    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @user }
    end
  end

  def edit
    @user = User.find_by(id: params[:id]) or render_404
    if @user && @user == current_user
      flash[:alert].clear if flash[:alert]
      @user
    else
      flash[:alert] = "You are not authorized to edit this page"
      redirect_to root_path
    end
  end

  def update
    @user = User.find_by(id: params[:id]) or render_404
    if @user && @user == current_user
      if @user.update(user_params)
        redirect_to user_path(@user)
      else
        render :edit
      end
    else
      flash[:alert] = "You are not authorized to edit this page"
      redirect_to root_path
    end
  end

  def destroy
    @user = User.find_by(id: params[:id]) or render_404
    if @user && @user == current_user
      if @user.destroy
        session.clear
        redirect_to root_path
      else
        redirect_to edit_user_path(@user)
      end
    else
      flash[:alert] = "You are not authorized to edit this page"
      redirect_to root_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :admin)
    end
end
