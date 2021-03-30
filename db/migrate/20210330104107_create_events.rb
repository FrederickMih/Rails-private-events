class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    drop_table :events
    create_table :events do |t|
      t.string :name
      t.string :category
      t.string :location
      t.string :date
      t.integer :user_id

      t.timestamps
    end
  end
end
