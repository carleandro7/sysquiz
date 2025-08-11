class ProvaRankingsController < ApplicationController
  before_action :authenticate_aluno!

  def show
    @prova = Prova.find(params[:id])
    # Busca todos os alunos que responderam a prova
    alunos = Aluno.joins(:provalunos).where(provalunos: { prova_id: @prova.id })
    # Calcula o desempenho de cada aluno
    @ranking = alunos.uniq.map do |aluno|
      respostas = Provaquestao.where(prova: @prova, aluno: aluno)
      total = respostas.count
      corretas = respostas.select { |pq| pq.resposta&.upcase == pq.questao.alternativa_correta&.upcase }.count
      percentual = total > 0 ? (corretas.to_f / total * 100).round(2) : 0
      { aluno: aluno, corretas: corretas, total: total, percentual: percentual }
    end
    @ranking = @ranking.sort_by { |r| -r[:percentual] }.first(5)
  end
end
