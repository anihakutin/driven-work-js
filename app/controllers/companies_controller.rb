class CompaniesController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :show]

  def index
    @companies = Company.all
  end

  def new
    @company = current_user.companies.build
  end

  def create
    @company = Company.new(user_params)
    if @company.save
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def show
    @company = Company.find_by(id: params[:id]) or render_404
  end

  def edit
    @company = Company.find_by(id: params[:id]) or render_404
  end

  def update
    @company = Company.find_by(id: params[:id]) or render_404
    @company.update(user_params)

    redirect_to company_path(@company)
  end

  def destroy
    if current_user.admin?
      company = Company.find_by(id: params[:id]) or render_404
      company.destroy

      flash[:alert] = "Company successfully deleted."
      redirect_to root_path
    else
      flash[:alert] = "Only an admin can delete posts."
      redirect_to company_path(company)
    end
  end

  private
    def user_params
      params.require(:company).permit(:name, :description, :year_founded, :user_id, :ceo_id)
    end
end
