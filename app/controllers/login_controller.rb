class LoginController < ApplicationController
  
  def index
  end
  
  def login
    session[:password]=params[:password]
    redirect_to widgets_url
  end
  
end