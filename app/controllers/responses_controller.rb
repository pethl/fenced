class ResponsesController < ApplicationController
  
  def create
      @dilemma = Dilemma.find(params[:dilemma_id])
      
      @response = @dilemma.responses.create!(params[:response])
      
      redirect_to static_pages_aftervote_path
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
