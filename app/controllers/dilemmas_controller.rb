class DilemmasController < ApplicationController

  
  # GET /dilemmas
  # GET /dilemmas.json
  def index
    @dilemmas = Dilemma.search(params[:search])
  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dilemmas }
    end
  end


  # GET /dilemmas/1
  # GET /dilemmas/1.json
  def show
        
    @dilemma = Dilemma.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dilemma }
    end
  end

  # GET /dilemmas/new
  # GET /dilemmas/new.json
  def new
    @dilemma = Dilemma.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dilemma }
    end
  end

  # GET /dilemmas/1/edit
  def edit
    @dilemma = Dilemma.find(params[:id])
  end

  # POST /dilemmas
  # POST /dilemmas.json
  def create
    @dilemma = Dilemma.new(params[:dilemma])

    respond_to do |format|
      if @dilemma.save
        format.html { redirect_to @dilemma, notice: 'Thanks, now we have your dilemma we can help you start to solve it.' }
        format.json { render json: @dilemma, status: :created, location: @dilemma }
      else
        format.html { render action: "new" }
        format.json { render json: @dilemma.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dilemmas/1
  # PUT /dilemmas/1.json
  def update
    @dilemma = Dilemma.find(params[:id])

    respond_to do |format|
      if @dilemma.update_attributes(params[:dilemma])
        format.html { redirect_to @dilemma, notice: 'Ok your dilemma has been updated, I hope you have it right this time.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dilemma.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dilemmas/1
  # DELETE /dilemmas/1.json
  def destroy
    @dilemma = Dilemma.find(params[:id])
    @dilemma.destroy

    respond_to do |format|
      format.html { redirect_to dilemmas_url }
      format.json { head :no_content }
    end
  end

  
  
end


 
