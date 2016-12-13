class AddAvailableDaysToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :available_days, :integer, default: 0
  end
end
