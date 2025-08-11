class Admin::AlunosController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :set_aluno, only: %i[show edit update destroy]

  def index
    @alunos = Aluno.all
  end

  def show; end

  def new
    @aluno = Aluno.new
  end

  def edit; end

  def create
    @aluno = Aluno.new(aluno_params)
    if @aluno.save
      redirect_to admin_aluno_path(@aluno), notice: "Aluno criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @aluno.update(aluno_params)
      redirect_to admin_aluno_path(@aluno), notice: "Aluno atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @aluno.destroy
    redirect_to admin_alunos_path, notice: "Aluno removido."
  end

  private
  def set_aluno
    @aluno = Aluno.find(params[:id])
  end
  def aluno_params
    params.require(:aluno).permit(:nome, :instituica_id, :escola_id, :serieano_id, :username, :password, :password_confirmation)
  end
end
