class Admin::PageVersionsController < AdminController
  before_filter :authorize_user
  
  def show
    @page_version = PageVersion.find(params[:id])
  end

  def restore
    @page_version = PageVersion.find(params[:id])
    page = @page_version.page
    if page.revert_to!(@page_version.version)
      flash[:notice] = "Page successfuly restored to version #{@page_version.version}."
      redirect_to admin_pages_path
    else      
      flash[:error] = "Page could not be restored."
      redirect_to admin_page_version_path(@page_version)
    end
  end

end
