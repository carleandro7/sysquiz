class Admin::ProvasController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :set_prova, only: %i[show edit update destroy]

  def index
    @provas = Prova.all
  end

  def show
    @agrupados = @prova.provalunos.includes(aluno: [:escola, :serieano]).group_by { |pl| [pl.aluno.escola.nome, pl.aluno.serieano.nome] }
  end

  def new
    @prova = Prova.new
  end

  def edit; end

  def create
    @prova = Prova.new(prova_params)
    @prova.instituica_id = current_user.instituica_id
    @prova.questaos.each { |q| q.instituica_id = current_user.instituica_id }
    if @prova.save
      redirect_to admin_prova_path(@prova), notice: "Prova criada com sucesso."
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    @prova.questaos.each { |q| q.instituica_id = current_user.instituica_id }
    if @prova.update(prova_params)
      redirect_to admin_prova_path(@prova), notice: "Prova atualizada com sucesso."
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @prova.destroy
    redirect_to admin_provas_path, notice: "Prova removida."
  end

  private
  def set_prova
    @prova = Prova.find(params[:id])
  end
  def prova_params
    params.require(:prova).permit(:titulo, :descricao, :escola_id, :data_inicio, :data_fim, :tempo_limite,
      serieano_ids: [],
      questaos_attributes: [
        :id, :enuciado, :letra_a, :letra_b, :letra_c, :letra_d, :letra_e, :alternativa_correta, :instituica_id, :_destroy
      ]
    )
  end
end
