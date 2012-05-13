# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper  

  def page_title
    @title || (@page.nil? ? controller.action_name.humanize.capitalize : @page.title)
  end

  def keywords
    @keywords || (@page.nil? ? '' : @page.keywords)
  end

  def description
    @description || (@page.nil? ? '' : @page.description)
  end

  def flash_message
    flash_content = ''
    if flash[:note]
      klass = 'alert alert-success'
      flash_content = flash[:note]
    elsif flash[:notice]
      klass='alert alert-success'
      flash_content = flash[:notice]
    elsif flash[:error]
      klass = 'alert alert-error'
      flash_content = content_tag(:h1, "Error!") + flash[:error]
    end
    return if flash_content.nil?
    flash_content += content_tag(:a, 'x', :class => 'close', "data-dismiss" => 'alert')
    content_tag(:div, flash_content.html_safe, :class => klass)
  end

  def is_admin?
    return true if Rails.env.test?
    if request.url.include?("/admin")
      true
    else
      false
    end
  end

  def draw_menu(m, options)
    id = options[:id] || m.downcase.gsub(' ', '-')
    direction = options[:direction] || 'horizontal'
    admin_only = options[:admin_only] || false
    if( admin_only and is_admin? ) or !admin_only
      # TODO add handling to partials for vertical and horizontal menus layouts
      menu = MenuItem.find_by_label(m)      
      if menu.nil?
        render :text => '' #:nothing => true
      end
      render :partial => "shared/menu_#{direction}", :locals => {:menu => menu, :id => id}
     end
  end

  def sort_link(title, field, options = {})
    condition = options[:unless] if options.has_key?(:unless)
    direction = params[:direction] == 'ASC' ? 'DESC' : 'ASC'    
    link_to_unless condition, title, request.parameters.merge( {:field => field, :direction => direction} )
  end
end
