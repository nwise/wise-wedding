class Admin::UsersController < AdminController
  before_filter :authorize_user
  # GET /admin/users
  # GET /admin/users.xml
  def index
    @users = User.all
  end

  # GET /admin/users/1
  # GET /admin/users/1.xml
  def show
    @user = current_user
  end

  # GET /admin/users/new
  # GET /admin/users/new.xml
  def new
    @user = User.new         
  end

  # GET /admin/users/1/edit
  def edit
    @user = current_user
  end

  # POST /admin/users
  # POST /admin/users.xml
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'Registration successfull.'      
      redirect_to root_url
    else
      render :action => "new"
    end
  end

  # PUT /admin/users/1
  # PUT /admin/users/1.xml
  def update
    @user = current_user  
    if @user.update_attributes(params[:user])
      flash[:notice] = 'User was successfully updated.'
      redirect_to root_url
    else
      render :action => "edit"
    end
  end

  # DELETE /admin/users/1
  # DELETE /admin/users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy    
    redirect_to root_url    
  end

  def toggle_admin
    user = User.find(params[:id])
    admin_role = Role.find_by_name('admin')
    if params[:value] == 'yes'
      user.roles << admin_role
    else
      user.roles = []
    end
    render :nothing => true
  end
end
