class CreateSipityNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :sipity_notifications do |t|

      t.timestamps
    end
  end
end
