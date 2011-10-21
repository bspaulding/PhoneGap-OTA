class CreatePhoneGapUsers < ActiveRecord::Migration
  def up
    create_table :phone_gap_users do |t|
      t.string :email

      t.timestamps
    end
  end

  def down
    drop_table :phone_gap_users
  end
end
