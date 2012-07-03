class HomeController < ApplicationController
  def index
  end
  
  def find

    @string = params[:string] || session[:string] 
    
   end
end
