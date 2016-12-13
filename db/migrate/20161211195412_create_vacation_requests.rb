class CreateVacationRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :vacation_requests do |t|
      t.date :start_date
      t.date :end_date
      t.string :message
      t.string :comments
      t.boolean :accepted
      t.boolean :rejected
      t.integer :admin_user_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
