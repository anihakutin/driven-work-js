class CeosController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :show]

  def index
    @ceos = Ceo.all
  end

  def new
    @ceo = Ceo.new
  end

  def create
    @ceo = Ceo.new(user_params)
    if @ceo.save
      redirect_to ceo_path(@ceo)
    else
      render :new
    end
  end

  def show
    @ceo = Ceo.find_by(id: params[:id]) or render_404
  end

  def edit
    @ceo = Ceo.find_by(id: params[:id]) or render_404
  end

  def update
    @ceo = Ceo.update(user_params) or render :edit
  end

  def destroy
    if current_user.admin?
      ceo = Ceo.find_by(id: params[:id]) or render_404
      ceo.destroy

      flash[:alert] = "Ceo successfully deleted."
      redirect_to root_path
    else
      flash[:alert] = "Only an admin can delete posts."
      redirect_to ceo_path(ceo)
    end
  end

  private
    def user_params
      params.require(:ceo).permit(:name, :year_born, :net_worth, :company_ids)
    end
end
