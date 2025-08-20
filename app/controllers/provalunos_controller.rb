class ProvalunosController < ApplicationController
  before_action :set_provaluno, only: %i[ show edit update destroy ]

  # GET /provalunos or /provalunos.json
  def index
    @provalunos = Provaluno.all
  end

  # GET /provalunos/1 or /provalunos/1.json
  def show
  end

  # GET /provalunos/new
  def new
    @provaluno = Provaluno.new
  end

  # GET /provalunos/1/edit
  def edit
    # Garante que só o aluno dono pode acessar
    if current_aluno != @provaluno.aluno
      redirect_to aluno_dashboard_path, alert: 'Acesso não autorizado.'
      return
    end
    @provaquestaos = Provaquestao.where(prova: @provaluno.prova, aluno: @provaluno.aluno).includes(:questao)
    # Se já respondeu todas, bloqueia acesso
    if @provaquestaos.all? { |pq| pq.resposta.present? }
      redirect_to aluno_dashboard_path, alert: 'Você já respondeu esta prova e não pode mais visualizá-la.'
      return
    end
  end

  # POST /provalunos or /provalunos.json
  def create
    # Busca o aluno logado (ajuste conforme autenticação)
    aluno = current_aluno
    prova = Prova.find(params[:prova_id])

    # Garante apenas uma tentativa por aluno/prova
    @provaluno = Provaluno.find_or_create_by(aluno: aluno, prova: prova)

    if @provaluno.inicio.blank?
      @provaluno.update(inicio: Time.current)
      @provaluno.reload
    end

    # Embaralha as questões para este aluno
    questoes_embaralhadas = prova.questaos.to_a.shuffle
    questoes_embaralhadas.each do |questao|
      pq = Provaquestao.find_or_create_by!(prova: prova, aluno: aluno, questao: questao)
      # Embaralha as alternativas (letras) e salva no campo embaralhada
      letras = %w[a b c d e].select { |l| questao.send("letra_#{l}").present? }
      pq.update(embaralhada: letras.shuffle.join) if pq.embaralhada.blank?
    end

    redirect_to edit_provaluno_path(@provaluno)
  end

  # PATCH/PUT /provalunos/1 or /provalunos/1.json
  def update
    @provaquestaos = Provaquestao.where(prova: @provaluno.prova, aluno: @provaluno.aluno)
    # Se já respondeu todas, não permite alteração nem visualização
    if @provaquestaos.all? { |pq| pq.resposta.present? }
      redirect_to aluno_dashboard_path, alert: 'Você já respondeu esta prova e não pode mais visualizá-la.'
      return
    end
    # Impede salvar após o tempo limite (em minutos)
    tempo_limite = @provaluno.prova.tempo_limite || 120 # minutos
    inicio = @provaluno.inicio || Time.current
    tempo_decorrido = ((Time.current - inicio) / 60).to_i # minutos
    if tempo_decorrido > tempo_limite
      redirect_to aluno_dashboard_path, alert: 'Tempo da prova esgotado! Apenas as respostas já salvas foram consideradas.'
      return
    end
    # Salva as respostas das questões
    if params[:provaquestaos]
      params[:provaquestaos].each do |pq_id, pq_params|
        pq = Provaquestao.find(pq_id)
        pq.update(resposta: pq_params[:resposta])
      end
    end
    respond_to do |format|
      format.html { redirect_to aluno_dashboard_path, notice: "Respostas salvas com sucesso.", status: :see_other }
      format.json { render :show, status: :ok, location: @provaluno }
    end
  end

  # DELETE /provalunos/1 or /provalunos/1.json
  def destroy
    @provaluno.destroy!

    respond_to do |format|
      format.html { redirect_to provalunos_path, notice: "Provaluno was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provaluno
      @provaluno = Provaluno.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def provaluno_params
      params.fetch(:provaluno, {}).permit(:prova_id, :aluno_id, :tempo_limite)
    end
end
