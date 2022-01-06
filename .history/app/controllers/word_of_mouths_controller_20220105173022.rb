class WordOfMouthsController < ApplicationController
  before_action :set_word_of_mouth, only: [:show, :edit, :update, :destroy]

  # GET /word_of_mouths
  # GET /word_of_mouths.json
  def index
    @word_of_mouths = WordOfMouth.all
  end

  # GET /word_of_mouths/1
  # GET /word_of_mouths/1.json
  def show
  end

  # GET /word_of_mouths/new
  def new
    @word_of_mouth = WordOfMouth.new
  end

  # GET /word_of_mouths/1/edit
  def edit
  end

  # POST /word_of_mouths
  # POST /word_of_mouths.json
  def create
    @word_of_mouth = WordOfMouth.new(word_of_mouth_params)

    respond_to do |format|
      if @word_of_mouth.save
        format.html { redirect_to @word_of_mouth, notice: 'Word of mouth was successfully created.' }
        format.json { render :show, status: :created, location: @word_of_mouth }
      else
        format.html { render :new }
        format.json { render json: @word_of_mouth.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /word_of_mouths/1
  # PATCH/PUT /word_of_mouths/1.json
  def update
    respond_to do |format|
      if @word_of_mouth.update(word_of_mouth_params)
        format.html { redirect_to @word_of_mouth, notice: 'Word of mouth was successfully updated.' }
        format.json { render :show, status: :ok, location: @word_of_mouth }
      else
        format.html { render :edit }
        format.json { render json: @word_of_mouth.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /word_of_mouths/1
  # DELETE /word_of_mouths/1.json
  def destroy
    @word_of_mouth.destroy
    respond_to do |format|
      format.html { redirect_to word_of_mouths_url, notice: 'Word of mouth was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word_of_mouth
      @word_of_mouth = WordOfMouth.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_of_mouth_params
      params.fetch(:word_of_mouth, {})
    end
end
