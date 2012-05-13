class ContactUsForm < ActiveRecord::Base

  def self.columns() @columns ||= []; end
  def self.column(name, sql_type = nil, default = nil, null = true)
    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
  end

  column :first_name,               :string
  column :last_name,                :string
  column :address1,                 :string
  column :address2,                 :string
  column :city,                     :string
  column :state,                    :string
  column :zip,                      :string
  column :phone,                    :string
  column :email_address,            :string
  column :company,                  :string
  column :comments,                 :text

  validates_presence_of :first_name, :last_name, :address1, :city, :state, :zip, :phone, :email_address

  validates_format_of :phone,
                      :with => /^(1([\-\.]{1})?)?[0-9]{3}([\-\.]{1})?[0-9]{3}([\-\.]{1})?[0-9]{4}$/,
                      :message => 'is invalid'

  validates_format_of :first_name, :last_name, :address1, :address2, :city,
                      :with    => /^[a-zA-Z0-9\' ,.&\/\-]*$/,
                      :message => 'contains invalid characters.<br>
                                   The following characters are allowed:<br>
                                   - alphanumeric,<br>
                                   - spaces,<br>- commas,<br>- periods,<br>- single quotes<br>- and dashes'

  validates_inclusion_of  :state,
                          :in => %w{ AL AK AZ AR CA CO CT DE DC FL GA HI ID IL IN
                                     IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH
                                     NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT
                                     VT VA WA WV WI WY},
                          :message => "must choose a state"
end