class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.xml
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.xml
  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        format.html { redirect_to(@order, :notice => 'Order was successfully created.') }
        format.xml  { render :xml => @order, :status => :created, :location => @order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.xml
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to(@order, :notice => 'Order was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.xml
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end

  # POST /add_box/1?box_id=1
  def add_box
    @order=Order.find(params[:id])
    @box = Box.find(params[:box_id])

    respond_to do |format|
      if !@order.boxes.include?(@box) && @order.boxes << @box
        flash[:notice] = "Box was successfully added to order"
        format.html { redirect_to (@order)}
        format.xml {head :ok}
        format.js { render :action => 'add_box' } #Finds add_box.js.rjs  ## Not needed
      else
        format.html { render :action => "edit"}
        format.xml { render :xml => @order.errors,
          :status => :unprocessable_entity
        }
      end

    end
  end

  def remove_box
    @order=Order.find(params[:id])
    @box = Box.find(params[:box_id])

    respond_to do |format|
      if @order.boxes.delete(@box)
        flash[:notice] = "Box was successfully removed order"
        format.html { redirect_to (@order)}
        format.xml {head :ok}
        format.js
      else
        format.html { render :action => "edit"}
        format.xml { render :xml => @order.errors,
          :status => :unprocessable_entity
        }
      end

    end
  end

end
