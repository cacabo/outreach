class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :secondary_email
      t.string :cell
      t.string :work
      t.string :company
      t.string :company_details
      t.string :role
      t.string :linkedin
      t.string :facebook
      t.string :notes
      t.boolean :long_term

      t.timestamps
    end
  end
end
