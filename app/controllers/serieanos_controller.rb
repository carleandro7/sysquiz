class SerieanosController < ApplicationController
  before_action :set_serieano, only: %i[ show edit update destroy ]

  # GET /serieanos or /serieanos.json
  def index
    @serieanos = Serieano.all
  end

  # GET /serieanos/1 or /serieanos/1.json
  def show
  end

  # GET /serieanos/new
  def new
    @serieano = Serieano.new
  end

  # GET /serieanos/1/edit
  def edit
  end

  # POST /serieanos or /serieanos.json
  def create
    @serieano = Serieano.new(serieano_params)

    respond_to do |format|
      if @serieano.save
        format.html { redirect_to @serieano, notice: "Serieano was successfully created." }
        format.json { render :show, status: :created, location: @serieano }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @serieano.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /serieanos/1 or /serieanos/1.json
  def update
    respond_to do |format|
      if @serieano.update(serieano_params)
        format.html { redirect_to @serieano, notice: "Serieano was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @serieano }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @serieano.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /serieanos/1 or /serieanos/1.json
  def destroy
    @serieano.destroy!

    respond_to do |format|
      format.html { redirect_to serieanos_path, notice: "Serieano was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_serieano
      @serieano = Serieano.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def serieano_params
      params.expect(serieano: [ :nome, :escola_id ])
    end
end
