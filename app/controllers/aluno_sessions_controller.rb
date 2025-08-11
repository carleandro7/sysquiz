class AlunoSessionsController < ApplicationController
  def new
  end

  def create
    @aluno = Aluno.find_by(username: params[:username])
    if @aluno&.authenticate(params[:password])
      session[:aluno_id] = @aluno.id
      redirect_to root_path, notice: "Login realizado com sucesso!"
    else
      flash.now[:alert] = "Usuário ou senha inválidos."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:aluno_id] = nil
    redirect_to root_path, notice: "Logout realizado com sucesso!"
  end
end
