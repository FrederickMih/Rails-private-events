class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    drop_table :users
    create_table :users do |t|
      t.string :username

      t.timestamps
    end
  end
end
