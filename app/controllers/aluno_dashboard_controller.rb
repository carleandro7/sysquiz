class AlunoDashboardController < ApplicationController
  before_action :authenticate_aluno!

  def index
    @aluno = current_aluno
    @provas = Prova.joins(:serieanos).where(serieanos: { id: @aluno.serieano_id }).distinct
  end
end
