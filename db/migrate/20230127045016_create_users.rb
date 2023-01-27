class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    #if issues with users arise if_not_exists is likely culprit
    create_table :users, if_not_exists: true do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
