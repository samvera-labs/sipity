class CreateSipityNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :sipity_notifications do |t|
      t.string   'name', null: false
      t.string 'notification_type', null: false
      t.timestamps
    end
    add_index 'sipity_notifications', ['name'], name: 'index_sipity_notifications_on_name', unique: true
    add_index 'sipity_notifications', ['notification_type'], name: 'index_sipity_notifications_on_notification_type'
  end
end
