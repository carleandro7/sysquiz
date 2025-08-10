class InstituicasController < ApplicationController
  before_action :set_instituica, only: %i[ show edit update destroy ]

  # GET /instituicas or /instituicas.json
  def index
    @instituicas = Instituica.all
  end

  # GET /instituicas/1 or /instituicas/1.json
  def show
  end

  # GET /instituicas/new
  def new
    @instituica = Instituica.new
  end

  # GET /instituicas/1/edit
  def edit
  end

  # POST /instituicas or /instituicas.json
  def create
    @instituica = Instituica.new(instituica_params)

    respond_to do |format|
      if @instituica.save
        format.html { redirect_to @instituica, notice: "Instituica was successfully created." }
        format.json { render :show, status: :created, location: @instituica }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @instituica.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instituicas/1 or /instituicas/1.json
  def update
    respond_to do |format|
      if @instituica.update(instituica_params)
        format.html { redirect_to @instituica, notice: "Instituica was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @instituica }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @instituica.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instituicas/1 or /instituicas/1.json
  def destroy
    @instituica.destroy!

    respond_to do |format|
      format.html { redirect_to instituicas_path, notice: "Instituica was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instituica
      @instituica = Instituica.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def instituica_params
      params.expect(instituica: [ :nome ])
    end
end
