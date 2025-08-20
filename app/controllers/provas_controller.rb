class ProvasController < ApplicationController
  before_action :set_prova, only: %i[ show edit update destroy ]

  # GET /provas or /provas.json
  def index
    @provas = Prova.all
  end

  # GET /provas/1 or /provas/1.json
  def show
  end

  # GET /provas/new
  def new
    @prova = Prova.new
  end

  # GET /provas/1/edit
  def edit
  end

  # POST /provas or /provas.json
  def create
    @prova = Prova.new(prova_params)

    respond_to do |format|
      if @prova.save
        format.html { redirect_to @prova, notice: "Prova was successfully created." }
        format.json { render :show, status: :created, location: @prova }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @prova.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /provas/1 or /provas/1.json
  def update
    respond_to do |format|
      if @prova.update(prova_params)
        format.html { redirect_to @prova, notice: "Prova was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @prova }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @prova.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /provas/1 or /provas/1.json
  def destroy
    @prova.destroy!

    respond_to do |format|
      format.html { redirect_to provas_path, notice: "Prova was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prova
      @prova = Prova.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def prova_params
      params.expect(prova: [ :titulo, :descricao, :data_inicio, :data_fim, :tempo_limite, :instituica_id ])
    end
end
