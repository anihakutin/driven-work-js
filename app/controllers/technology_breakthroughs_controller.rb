class TechnologyBreakthroughsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :show]

  def index
    @technology_breakthroughs = TechnologyBreakthrough.all
  end

  def new
    company = Company.find_by(id: params[:company_id])
    @technology_breakthrough = company.technology_breakthroughs.build
  end

  def create
    @technology_breakthrough = TechnologyBreakthrough.new(user_params)

    if @technology_breakthrough.save
      redirect_to company_technology_breakthrough_path(@technology_breakthrough.company, @technology_breakthrough)
    else
      redirect_to new_company_technology_breakthrough_path
    end
  end

  def show
    company = Company.find_by(id: params[:company_id]) or render_404
    @technology_breakthrough = company.technology_breakthroughs.find_by(id: params[:id]) or render_404
  end

  def edit
    company = Company.find_by(id: params[:company_id]) or render_404
    @technology_breakthrough = company.technology_breakthroughs.find_by(id: params[:id]) or render_404
  end

  def update
    company = Company.find_by(id: params[:company_id]) or render_404
    @technology_breakthrough = company.technology_breakthroughs.find_by(id: params[:id]) or render_404
    @technology_breakthrough.update(user_params)

    redirect_to company_technology_breakthrough_path(@technology_breakthrough.company, @technology_breakthrough)
  end

  def destroy

  end

  private
    def user_params
      params.require(:technology_breakthrough).permit(:name, :description, :year, :company_id)
    end
end
