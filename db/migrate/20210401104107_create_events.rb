class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :category
      t.string :location
      t.date :date
      t.integer :user_id

      t.timestamps
    end
  end
end
