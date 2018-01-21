class CreateAlerts < ActiveRecord::Migration[5.1]
  def change
    create_table :alerts do |t|
      t.belongs_to :user, foreign_key: true
      t.time :alert_time
      t.integer :train_id
      t.string :nickname

      t.timestamps
    end
  end
end
