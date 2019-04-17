class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :fullName
      t.string :email
      t.date :dateOfBirth
      t.string :address
      t.string :cityORtown
      t.string :postcode
      t.string :country
      t.string :photoOfUser

      t.timestamps
    end
  end
end
