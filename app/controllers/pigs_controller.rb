class PigsController < ApplicationController
  before_action :set_pig, only: %i[ show edit update destroy ]

  # GET /pigs or /pigs.json
  def index
    @pigs = Pig.all
  end

  # GET /pigs/1 or /pigs/1.json
  def show
  end

  # GET /pigs/new
  def new
    @pig = Pig.new
  end

  # GET /pigs/1/edit
  def edit
  end

  # POST /pigs or /pigs.json
  def create
    @pig = Pig.new(pig_params)

    respond_to do |format|
      if @pig.save
        format.html { redirect_to @pig, notice: "Pig was successfully created." }
        format.json { render :show, status: :created, location: @pig }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pig.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pigs/1 or /pigs/1.json
  def update
    respond_to do |format|
      if @pig.update(pig_params)
        format.html { redirect_to @pig, notice: "Pig was successfully updated." }
        format.json { render :show, status: :ok, location: @pig }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pig.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pigs/1 or /pigs/1.json
  def destroy
    @pig.destroy!

    respond_to do |format|
      format.html { redirect_to pigs_path, status: :see_other, notice: "Pig was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pig
      @pig = Pig.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def pig_params
      params.expect(pig: [ :name, :dead ])
    end
end
