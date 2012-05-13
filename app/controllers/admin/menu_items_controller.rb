class Admin::MenuItemsController < AdminController
  
  # GET /menu_items  
  def index
    @menu_items = MenuItem.find(:all, :conditions => 'parent_id IS NULL')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @menu_items }
    end
  end

  def show
    @menu_item = MenuItem.find(params[:id])
  end

  # GET /menu_items/new
  def new
    @menu_item = MenuItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @menu_item }
    end
  end

  # GET /menu_items/1/edit
  def edit
    @menu_item = MenuItem.find(params[:id])
  end

  # POST /menu_items  
  def create
    begin
      @parent = MenuItem.find(params[:menu_item][:parent_id])
      @menu_item = @parent.children.new(params[:menu_item])
    rescue ActiveRecord::RecordNotFound => e
      @menu_item = MenuItem.new(params[:menu_item])
    end
    
    if @menu_item.save
      if @parent
        @menu_item.update_attributes(:parent_id => @parent.id)
      else
        @menu_item.update_attributes(:parent_id => nil) 
      end
      flash[:notice] = 'New menu item created.'
      redirect_to :action => 'index'
    else
      flash[:errors] = 'New menu item could not be created.'
      render :action => "new"
    end
    
  end

  # PUT /menu_items/1
  # PUT /menu_items/1.xml
  def update
    @menu_item = MenuItem.find(params[:id])

    respond_to do |format|
      if @menu_item.update_attributes(params[:menu_item])
        flash[:notice] = 'MenuItem was successfully updated.'
        format.html { redirect_to :action => 'index' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @menu_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_items/1
  def destroy
    @menu_item = MenuItem.find(params[:id])
    @menu_item.destroy
     flash[:notice] = 'MenuItem was successfully destroyed.'
    respond_to do |format|
      format.html { redirect_to(admin_menu_items_url) }
      format.xml  { head :ok }
    end
  end

  def sort
    @menu_item = MenuItem.find(params[:menu_item].first).parent
    @menu_item.children.each do |child|
      child.position = params[:menu_item].index(child.id.to_s) + 1
      child.save
    end
    render :nothing => true
  end
end
