class ContactMailer < ActionMailer::Base

  def contact_us_email( contents ) 
    @contents = contents   
    #@subject                = 'Contact Us Form'
    #@recipients             = CONTACT_FORM_RECIPIENT
    #@from                   = contents.email_address
    #@sent_on                = Time.now
    #@headers                = {}
    mail(:to => CornerstoneCms::Application.config.contact_recipient, :subject => 'Contact Us Form', :from => @contents.email_address, :headers => {}) do |format|
      format.text { render :contact_us_email }
    end
  end  
end
