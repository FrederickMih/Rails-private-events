class DropTableUserEvent < ActiveRecord::Migration[6.1]
  def change
    drop_table :user_events
  end
end
