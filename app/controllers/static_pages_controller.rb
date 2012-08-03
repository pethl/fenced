class StaticPagesController < ApplicationController
  def help
  end

  def options
  end

  def find
        Dilemma.find(params[:search])
        redirect_to dilemma_path
  end

  def index
  end

  def about
  end
  
  
  def search

      @Static_pages = Dilemma.search(params[:search])
      
      
    end
  
end
