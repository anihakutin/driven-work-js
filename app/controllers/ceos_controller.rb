class CeosController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :show]

  def index
    @ceos = Ceo.all
  end

  def new

  end

  def create

  end

  def show
    @ceo = Ceo.find_by(id: params[:id]) or render_404
  end

  def edit

  end

  def update

  end

  def destroy

  end
end
