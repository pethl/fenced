class DilemmasController < ApplicationController
  require 'bitly'
    before_filter :signed_in_user,  only: [:create, :edit, :destroy]
    before_filter :correct_user,   only: :destroy
   
 def search
   @dilemmas = Dilemma.search(params[:search])
 end
  
  # GET /dilemmas
  # GET /dilemmas.json
  def index

    
    @dilemmas = Dilemma.paginate(page: params[:page])
  end


  # GET /dilemmas/1
  # GET /dilemmas/1.json
  def show  
    @dilemma = Dilemma.find(params[:id])
    
    
    if params['post_to_twitter']
       respond_to do |format|
           user = @dilemma.user_id.to_s
           tweet = "@" + user + ": Follow link to vote on my question - " + @dilemma.shorten_url
           Twitter.update(tweet)
       end
     elsif
       respond_to do |format|
           format.html # show.html.erb
           format.json { render json: @dilemma }
       end
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

    @dilemma = current_user.dilemmas.build(params[:dilemma])

    respond_to do |format|
      if @dilemma.save
        format.html { redirect_to @dilemma, notice: 'You have created a dilemma!' }
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
    @dilemma.destroy
       redirect_to user_path(@dilemma.user_id)
  end  
  
  private    
    
    def correct_user
          @dilemma = current_user.dilemmas.find_by_id(params[:id])
          redirect_to root_path if @dilemma.nil?
        end
    
    def admin_user
      @dilemma = current_user.dilemmas.find_by_id(params[:admin ])
          redirect_to(root_path) unless current_user.admin?
    end

    def post_to_twitter

      require 'twitter'
      require 'oauth'
      user = @dilemma.user_id.to_s
      tweet = "@" + user + ": Follow link to vote on my question - " + @dilemma.shorten_url
      Twitter.update(tweet)
    end
 
  
end


 
