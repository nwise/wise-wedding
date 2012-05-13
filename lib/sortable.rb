module Sortable
  def sort(field, direction, options = {})
    field ||= 'id'
    direction ||= 'ASC'
    with_scope :find => { :order => "#{field} #{direction}" } do
      find :all, options
    end
  end
end