module Admin::MenuItemsHelper

  def draw_menu_tree(menu_item)
    html = ''
    menu_item.children.each do |child|
      #html += "<li><a href='#{child.url}'>#{child.label}</a>"
      html += "<li id=" + "#{dom_id(child)}" + ">#{child.label}"
      html += link_to("<i class='icon-play-circle icon-white'></i>&nbsp; Create Submenu".html_safe,
                  new_admin_menu_item_path(:parent_id => child.id),
                  :id => "#{child.id}_add_child",
                  :title => 'add-child',
                  :class => 'btn btn-success') 
      html += link_to("<i class='icon-edit icon-white'></i>&nbsp; Edit Submenu".html_safe,
                  edit_admin_menu_item_path(child), :class => 'btn btn-primary')
      html += link_to("<i class='icon-trash icon-white'></i>&nbsp; Delete Submenu".html_safe, admin_menu_item_path(child),
                                                      :confirm => 'Are you sure?',
                                                      :method => :delete, :class => 'btn btn-warning') 
      html += "</li>"
      unless child.children.empty?
        html += '<ul>' + draw_menu_tree(child) + '</ul>'        
      end
      html += '</li>'
    end
    return html
  end

end
