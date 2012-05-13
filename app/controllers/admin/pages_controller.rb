class Admin::PagesController < AdminController
  before_filter :get_title
  before_filter :authorize_user
  before_filter :load_images, :except => [:index, :destroy]
  #
  # GET /admin/pages
  def index
    field = params[:field]
    direction = params[:direction]
    @pages = Page.paginate :page => params[:page], :per_page => 10, :order => 'title ASC'
    @page = Page.new
  end


  def show
    @page = Page.find(params[:id])
  end

  # GET /admin/pages/new
  def new
    @page = Page.new
  end

  # GET /admin/pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /admin/pages
  def create
    @page = Page.new(params[:page])

    if @page.save
      flash[:notice] = 'Page was successfully created.'
      redirect_to admin_pages_url
    else
      render :action => "new"
    end

  end

  # PUT /admin/pages/1
  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(params[:page])
      flash[:notice] = 'Page was successfully updated.'
      redirect_to admin_pages_url
    else
      render :action => "edit"
    end
  end

  # DELETE /admin/pages/1
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    flash[:notice] = 'Page was successfully deleted.'
    redirect_to(admin_pages_url)
  end

private

  def get_title
    @title = "#{params[:controller]}: #{params[:action]}".titleize
  end

  def load_images
    @admin_image = Image.new
    @images = Image.all
  end
end
