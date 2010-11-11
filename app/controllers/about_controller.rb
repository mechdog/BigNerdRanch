class AboutController < ApplicationController
  def company
    @year=params[:year]||1999
    @name=params[:name]||"NoName F'r"
    @browser=request.env["HTTP_USER_AGENT"]
    @dumpme=""
  end

  def contact  
  end
  
  def future
    @year=2010
     @name=params[:name]||"NoName F'r"
    render :template =>'about/company', :layout =>'beautiful'
  end
  
  def companie
    session[:password]="secret"
    flash[:notice] = "You spelled copmnay wrong you moron"
    redirect_to :controller => 'about', :action=>'company'
  end
  
  def supervisors
    @supervisors = ["Bob Jones", "Jodi Bell", "Matt Todd","Chris Kelly"]
  end
 
  def managers
    @managers = ["Wilbur Blixby", "Horatio Jebeiah", "Antoine Fisher","Julio Gallows"]
  end
  
  def monthly_special
    @mywidget=Widget.monthly_special
  end
  
  def more_info
  end
  
  def thank_you
    @full_name=params[:full_name]
    @color=params[:color]
  end
  
end
