class DispoTeachesController < ApplicationController
  before_action :set_dispo_teach, only: [:show, :edit, :update, :destroy]

  # GET /dispo_teaches
  # GET /dispo_teaches.json
  def index
    @dispo_teaches = DispoTeach.all
  end

  # GET /dispo_teaches/1
  # GET /dispo_teaches/1.json
  def show
  end

  # GET /dispo_teaches/new
  def new
    @dispo_teach = DispoTeach.new
  end

  # GET /dispo_teaches/1/edit
  def edit
  end

  # POST /dispo_teaches
  # POST /dispo_teaches.json
  def create
    @dispo_teach = DispoTeach.new(dispo_teach_params)

    respond_to do |format|
      if @dispo_teach.save
        format.html { redirect_to @dispo_teach, notice: 'Dispo teach was successfully created.' }
        format.json { render :show, status: :created, location: @dispo_teach }
      else
        format.html { render :new }
        format.json { render json: @dispo_teach.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dispo_teaches/1
  # PATCH/PUT /dispo_teaches/1.json
  def update
    respond_to do |format|
      if @dispo_teach.update(dispo_teach_params)
        format.html { redirect_to @dispo_teach, notice: 'Dispo teach was successfully updated.' }
        format.json { render :show, status: :ok, location: @dispo_teach }
      else
        format.html { render :edit }
        format.json { render json: @dispo_teach.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dispo_teaches/1
  # DELETE /dispo_teaches/1.json
  def destroy
    @dispo_teach.destroy
    respond_to do |format|
      format.html { redirect_to dispo_teaches_url, notice: 'Dispo teach was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dispo_teach
      @dispo_teach = DispoTeach.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dispo_teach_params
      params.require(:dispo_teach).permit(:teach_id, :integer, :date)
    end
end
