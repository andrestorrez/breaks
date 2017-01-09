class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.text :access_token
      t.string :provider
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
