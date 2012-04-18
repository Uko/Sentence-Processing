class WordCoresController < ApplicationController
  # GET /word_cores
  # GET /word_cores.json
  def index
    @word_cores = WordCore.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @word_cores }
    end
  end

  # GET /word_cores/1
  # GET /word_cores/1.json
  def show
    @word_core = WordCore.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @word_core }
    end
  end

  # GET /word_cores/new
  # GET /word_cores/new.json
  def new
    @word_core = WordCore.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @word_core }
    end
  end

  # GET /word_cores/1/edit
  def edit
    @word_core = WordCore.find(params[:id])
  end

  # POST /word_cores
  # POST /word_cores.json
  def create
    @word_core = WordCore.new(params[:word_core])

    respond_to do |format|
      if @word_core.save
        format.html { redirect_to @word_core, notice: 'Word core was successfully created.' }
        format.json { render json: @word_core, status: :created, location: @word_core }
      else
        format.html { render action: "new" }
        format.json { render json: @word_core.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /word_cores/1
  # PUT /word_cores/1.json
  def update
    @word_core = WordCore.find(params[:id])

    respond_to do |format|
      if @word_core.update_attributes(params[:word_core])
        format.html { redirect_to @word_core, notice: 'Word core was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @word_core.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /word_cores/1
  # DELETE /word_cores/1.json
  def destroy
    @word_core = WordCore.find(params[:id])
    @word_core.destroy

    respond_to do |format|
      format.html { redirect_to word_cores_url }
      format.json { head :no_content }
    end
  end
end
