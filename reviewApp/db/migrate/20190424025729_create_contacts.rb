class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :cname
      t.string :email
      t.text :subject
      t.text :message

      t.timestamps
    end
  end
end
