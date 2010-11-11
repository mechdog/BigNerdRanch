class InventoryController < ApplicationController
  def new
    @widget=Widget.new
  end

  def create
    @widget=Widget.create(params[:widget])
    redirect_to :controller=>'inventory',
      :action=>'show',
      :id=>@widget.id
  end

  def show
    @widget=Widget.find(params[:id])
  end

  def index
    @allwidgets=Widget.find(:all)
  end
  
  def edit
    @widget=Widget.find(params[:id])
  end
  
  def delete
    @widget=Widget.find(params[:id])
    @widget.destroy
    redirect_to :controller=>'inventory',
      :action=>'index'
  end
  
  def update
    compareWidget=Widget.new(params[:widget])
    @widget=Widget.find(params[:id])
    
    if @widget.need_update?(compareWidget)
      flash[:notice]="I had to update the record!"
    end
    
    @widget.update_attributes(params[:widget])
    redirect_to :controller=>'inventory',
      :action=>'show',
      :id=>@widget.id
  end
end
