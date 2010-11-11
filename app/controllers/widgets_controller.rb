class WidgetsController < ApplicationController
  
  before_filter :check_log_in, :except => [:index]
  
  # GET /widgets
  # GET /widgets.xml
  def index
    @widgets = Widget.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @widgets }
      format.rss  { render :layout => false}
      format.atom # index.atom.builder
    end
  end

  # GET /widgets/1
  # GET /widgets/1.xml
  def show
    if params[:name]
      @widget=Widget.find_by_name(params[:name])
    else
      @widget = Widget.find(params[:id])
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @widget } #generates the XML format
    end
  end
  
  def filter
    
    @widgets= params[:size].blank? ? Widget.all : Widget.where("size<?",params[:size])
   # if params[:size].blank? {flash[:notice]="Type in a fucking size dumbass!"}
    
     respond_to do |format|
        format.html {render :action =>"index"}# filter.html.erb
        format.xml  { render :xml => @widgets }
      end
    
  end

  # GET /widgets/new
  # GET /widgets/new.xml
  def new
    @widget = Widget.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @widget }
    end
  end

  # GET /widgets/1/edit
  def edit
    @widget = Widget.find(params[:id])
  end

  # POST /widgets
  # POST /widgets.xml
  def create
    @widget = Widget.new(params[:widget])

    respond_to do |format|
      if @widget.save
        Notifications.widget_creation(@widget).deliver  ## sEnds an email about the widget
        
        format.html { redirect_to(@widget, :notice => 'Widget was successfully created.') }
        format.xml  { render :xml => @widget, :status => :created, :location => @widget }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @widget.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /widgets/1
  # PUT /widgets/1.xml
  def update
    @widget = Widget.find(params[:id])

    respond_to do |format|
      if @widget.update_attributes(params[:widget])
        format.html { redirect_to(@widget, :notice => 'Widget was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @widget.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /widgets/1
  # DELETE /widgets/1.xml
  def destroy
    @widget = Widget.find(params[:id])
    @widget.destroy

    respond_to do |format|
      format.html { redirect_to(widgets_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def check_log_in
    unless is_logged_in?
      flash[:notice] = "You are not authorized!"
      redirect_to login_url
      return false
    end
  end
  
  def is_logged_in?
    session[:password]=="secret" ? true : false
  end
  
  
  
  
end
