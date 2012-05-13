# Before do
#   User.destroy_all
#   @current_user = User.create!(
#     :username => "admin",
#     :password => 'generic',
#     :password_confirmation => 'generic',
#     :email => "admin@example.com"
#   )
#   r = Role.create(:name => 'admin')
#   @current_user.roles << r
#   %w[admin/pages admin/menu_items admin].each do |controller|
#     %w[index new create edit update destroy].each do |action|
#       r.rights << Right.create(:name => "#{controller}/#{action}",
#                                :controller => "#{controller}",
#                                :action => "#{action}")
#     end
#   end
# end