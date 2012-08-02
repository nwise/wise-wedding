require 'csv'

class RsvpsController < ApplicationController

  before_filter :authenticate_user, :except => [:new, :create, :show]
  # GET /rsvps
  # GET /rsvps.json
  def index
    @rsvps = Rsvp.all

    respond_to do |format|
      format.html{
        render :index, :layout => 'admin'
      }  # index.html.erb
      format.json { render json: @rsvps }
    end
  end

  # GET /rsvps/1
  # GET /rsvps/1.json
  def show
    @rsvp = Rsvp.find(params[:id])
    if @rsvp.will_attend
      @message = "Great! We are looking forward to seeing you in September."
    else
      @message = "We are sorry you aren't attending, you wll be missed."
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rsvp }
    end
  end

  # GET /rsvps/new
  # GET /rsvps/new.json
  def new
    @rsvp = Rsvp.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rsvp }
    end
  end

  # GET /rsvps/1/edit
  def edit
    @rsvp = Rsvp.find(params[:id])
    render :edit, :layout => 'admin'
  end

  # POST /rsvps
  # POST /rsvps.json
  def create
    @rsvp = Rsvp.new(params[:rsvp])

    respond_to do |format|
      if @rsvp.save
        format.html { redirect_to rsvp_url(@rsvp)}
        format.json { render json: @rsvp, status: :created, location: @rsvp }
      else
        format.html { render action: "new" }
        format.json { render json: @rsvp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rsvps/1
  # PUT /rsvps/1.json
  def update
    @rsvp = Rsvp.find(params[:id])

    respond_to do |format|
      if @rsvp.update_attributes(params[:rsvp])
        format.html { redirect_to rsvps_url, notice: 'Rsvp was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rsvp.errors, status: :unprocessable_entity }
      end
    end
  end

  def download
    list = Rsvp.all

    csv_string = CSV.generate do |csv|
      csv << ["First Name", "Last Name", "Email Address", "Attending?", "Number Attending"]
      list.each do |item|
        csv << [item.first_name,
                item.last_name,
                item.email_address,
                item.will_attend,
                item.number_to_rsvp]
      end
    end
    send_data csv_string, :type => "text/plain", :filename => "rsvp_list.csv", :disposition => 'attachment'
  end

  # DELETE /rsvps/1
  # DELETE /rsvps/1.json
  def destroy
    @rsvp = Rsvp.find(params[:id])
    @rsvp.destroy

    respond_to do |format|
      format.html { redirect_to rsvps_url }
      format.json { head :no_content }
    end
  end

  def authenticate_user
    authenticate_user! unless Rails.env.test?
  end
end
