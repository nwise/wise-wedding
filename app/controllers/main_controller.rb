class MainController < ApplicationController

  def content_page
    path = params[:path] || 'index'
    @page = Page.where(url_tag: path).first

    unless @page.nil?
      
      @title = @page.html_title
      @h1 = @page.title

      respond_to do |format|
        format.html { render :layout => determine_layout }
        format.xml  { render :xml => @page }
      end
    else
      respond_to do |format|
        format.html { render :file => "#{Rails.root}/public/404.html", :status => "404 Not Found" }
        format.all { render :nothing => true, :status => "404 Not Found" }
      end
    end
  end

  def site_search
    @pages = Page.search(params[:search][:search_term])
  end

  def determine_layout
    if request[:path] == 'index' || request[:path].blank?
      'index'
    else 
      'application' 
    end
  end
end
