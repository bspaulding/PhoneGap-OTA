class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.integer :phone_gap_user_id
      t.string :app_id
      t.string :title
      t.string :version
      t.string :package
      t.string :url

      t.timestamps
    end
  end
end
