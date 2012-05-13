class Role < ActiveRecord::Base
  has_many :rights_roles
  has_many :rights, :through => :rights_roles

  has_many :roles_users
  has_many :users, :through => :roles_users
end
