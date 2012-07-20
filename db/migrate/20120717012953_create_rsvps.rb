class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.boolean :will_attend
      t.integer :number_to_rsvp

      t.timestamps
    end
  end
end
