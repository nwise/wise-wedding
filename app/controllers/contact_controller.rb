class ContactController < ApplicationController

  def contact_us
    @title = "Contact Us"
    @contact_us_form = ContactUsForm.new(params[:contact_us_form])
    
    unless request.post?
      @contact_us_form = ContactUsForm.new
    else
      if @contact_us_form.valid?
        message = ContactMailer.contact_us_email(@contact_us_form)
        message.deliver
        redirect_to :action => :thank_you
      else
        render :action => :contact_us
      end
    end
  end

end
