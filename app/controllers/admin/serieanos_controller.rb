class Admin::SerieanosController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :set_serieano, only: %i[show edit update destroy]

  def index
    @serieanos = Serieano.all
  end

  def show; end

  def new
    @serieano = Serieano.new
  end

  def edit; end

  def create
    @serieano = Serieano.new(serieano_params)
    if @serieano.save
      redirect_to admin_serieano_path(@serieano), notice: "Série criada com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @serieano.update(serieano_params)
      redirect_to admin_serieano_path(@serieano), notice: "Série atualizada com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @serieano.destroy
    redirect_to admin_serieanos_path, notice: "Série removida."
  end

  private
  def set_serieano
    @serieano = Serieano.find(params[:id])
  end
  def serieano_params
    params.require(:serieano).permit(:nome, :escola_id)
  end
end
