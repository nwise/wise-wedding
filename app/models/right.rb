class Right < ActiveRecord::Base  
  has_many :roles, :through => :rights_roles
end
