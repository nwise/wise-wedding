class Admin::ImagesController < AdminController
  # GET /admin/images
  # GET /admin/images.json
  def index
    @admin_images = Image.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_images }
    end
  end

  # GET /admin/images/1
  # GET /admin/images/1.json
  def show
    @admin_image = Image.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_image }
    end
  end

  # GET /admin/images/new
  # GET /admin/images/new.json
  def new
    @admin_image = Image.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_image }
    end
  end

  # GET /admin/images/1/edit
  def edit
    @admin_image = Image.find(params[:id])
  end

  # POST /admin/images
  # POST /admin/images.json
  def create
    @admin_image = Image.new(params[:admin_image])
    respond_to do |format|
      if @admin_image.save
        format.html { redirect_to admin_images_url, notice: 'Image was successfully created.' }
        format.json do
          @images = Image.all
          render :json => { :image_list => render_to_string(:partial => 'admin/images/list.html.erb') }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @admin_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/images/1
  # PUT /admin/images/1.json
  def update
    @admin_image = Image.find(params[:id])

    respond_to do |format|
      if @admin_image.update_attributes(params[:admin_image])
        format.html { redirect_to @admin_image, notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/images/1
  # DELETE /admin/images/1.json
  def destroy
    @admin_image = Image.find(params[:id])
    @admin_image.destroy

    respond_to do |format|
      format.html { redirect_to admin_images_url }
      format.json { head :no_content }
    end
  end
end
