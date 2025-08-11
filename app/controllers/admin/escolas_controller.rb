class Admin::EscolasController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :set_escola, only: %i[show edit update destroy]

  def index
    @escolas = Escola.all
  end

  def show; end

  def new
    @escola = Escola.new
  end

  def edit; end

  def create
    @escola = Escola.new(escola_params)
    if @escola.save
      redirect_to admin_escola_path(@escola), notice: "Escola criada com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @escola.update(escola_params)
      redirect_to admin_escola_path(@escola), notice: "Escola atualizada com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @escola.destroy
    redirect_to admin_escolas_path, notice: "Escola removida."
  end

  private
  def set_escola
    @escola = Escola.find(params[:id])
  end
  def escola_params
    params.require(:escola).permit(:nome, :codinep, :instituica_id)
  end
end
