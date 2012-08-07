class ResponsesController < ApplicationController
  
  def create
      @dilemma = Dilemma.find(params[:dilemma_id])
       
     @response = @dilemma.responses.create(params[:response])#will give you an object to work with instead of throwing an exception.
      if  @response.valid?
          @response.save
          redirect_to static_pages_aftervote_path
    else
        @response.errors
        flash[:error] = @response.errors.full_messages
        render "badvote"
      end
    end
  
    def count
        @dilemma = Dilemma.find(params[:dilemma_id])
        @response = @dilemma.responses.count
      end
      
    def new
        @dilemma = Dilemma.find(params[:dilemma_id])
       @response = Response.new
    end
    
    def show
        @dilemma = Dilemma.find(params[:dilemma_id])
       @responses = @dilemma.responses
       
    end
  # helper_method :count
end
