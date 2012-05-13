class MenuItem < ActiveRecord::Base  
  acts_as_tree :order => "position"
  #acts_as_list :column => "parent_id"

  def path
    if !self.url.blank?
      "#{self.url}"
    elsif !self.page_id.blank?
      "/#{Page.find(self.page_id).url_tag}"
    else
      "#"
    end
  end
end
