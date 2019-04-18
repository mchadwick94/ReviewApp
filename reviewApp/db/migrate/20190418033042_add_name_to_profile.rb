class AddNameToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :userid, :string
  end
end
