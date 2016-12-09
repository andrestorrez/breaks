class CreateUserTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams_users do |t|
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true
      t.string :nickname

      t.timestamps
    end
  end
end
