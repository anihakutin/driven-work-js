class ProblemsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :show]

  def index
    @problems = Problem.all
  end

  def new
    company = Company.find_by(id: params[:company_id])
    @problem = company.problems.build
  end

  def create
    @problem = Problem.new(user_params)
    if @problem.save
      redirect_to company_problem_path(@problem.company, @problem)
    else
      redirect_to new_problem_path
    end
  end

  def show
    company = Company.find_by(id: params[:company_id]) or render_404
    @problem = company.problems.find_by(id: params[:id]) or render_404
  end

  def edit
    company = Company.find_by(id: params[:company_id]) or render_404
    @problem = company.problems.find_by(id: params[:id]) or render_404
  end

  def update
    company = Company.find_by(id: params[:company_id]) or render_404
    @problem = company.problems.find_by(id: params[:id]) or render_404
    @problem.update(user_params)

    redirect_to company_problem_path(@problem.company, @problem)
  end

  def destroy

  end

  private
    def user_params
      params.require(:problem).permit(:name, :description, :year_solved, :company_id)
    end
end
